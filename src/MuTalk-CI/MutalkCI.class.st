Class {
	#name : #MutalkCI,
	#superclass : #Object,
	#instVars : [
		'project',
		'commit'
	],
	#category : #'MuTalk-CI'
}

{ #category : #'as yet unclassified' }
MutalkCI >> allChangesForRepo [
	| repo cmt diff leafs targets |
	repo := self getRepo.
	cmt := repo commitishNamed: commit.
	diff := cmt diffFromHead.
	leafs := OrderedCollection new.
	diff tree allChildrenDo: [ :node | 
		node children ifEmpty: [ leafs add: node ] ].
	leafs := leafs reject: [ :n | n value isRemoval ].
	leafs := leafs select: [ :n | n value definition isMethodDefinition ].
	leafs := leafs reject: [ :n | 
		         n value definition contextClass isNil or: [ 
			         n value definition contextClass isTestCase or: [ 
				         (n value definition contextClass includesSelector:
					          n value definition name) not ] ] ].
	targets := leafs collect: [ :n | 
		           n value definition contextClass
		           >> n value definition name ].
	^ targets
]

{ #category : #private }
MutalkCI >> allClassesForRepo [

	| repo |
	repo := self getRepo.
	^ (repo workingCopy packages select: [ :p | p isLoaded ]) 
		  flatCollect: [ :p | 
		  p package asPackage definedClasses asOrderedCollection ]
]

{ #category : #accessing }
MutalkCI >> commit [

	^ commit
]

{ #category : #accessing }
MutalkCI >> commit: anObject [

	commit := anObject
]

{ #category : #private }
MutalkCI >> exportFileName [
	^ '__mutalk_export.json'
]

{ #category : #private }
MutalkCI >> exportResultJson: analysis [

	| json file repo commitFrom commitTo timestamp |
	repo := self getRepo.
	commitFrom := commit.
	commitTo := repo head commit id.
	timestamp := DateAndTime now asUnixTime.

	json := MutalkCITonelJsonExporter new
		        mtResult: analysis;
		        commit: commitTo;
		        pull_request_id: '???';
		        root: repo subdirectory;
		        cloneLocation: repo location fullName;
		        export.
	file := FileLocator imageDirectory / self exportFileName.
	file exists ifTrue: [ file delete ].
	file writeStream
		nextPutAll: json;
		close
]

{ #category : #'as yet unclassified' }
MutalkCI >> getRepo [

	IceRepository registry
		detect: [ :r | r name = project ]
		ifNone: [ 
			| gitClone |
			gitClone := Smalltalk os environment asDictionary
				            at: #GITHUB_WORKSPACE
				            ifAbsent: [ 
					            'GITHUB_WORKSPACE missing' traceCr.
					            Smalltalk exitFailure ].

			IceRepository registry
				detect: [ :r | r name = project ]
				ifNone: [ 
					| r tmp |
					r := IceRepositoryCreator new
						     repository: nil;
						     location: gitClone asFileReference.
					r := r createRepository.
					r register ] ].
	IceRepository registry
		detect: [ :r | r name = project ]
	ifFound: [ :r | ^ r ].
		
	self error: 'repo not installed. ' , project
]

{ #category : #'as yet unclassified' }
MutalkCI >> mutateAll [

	| classes tests targets |
	classes := self allClassesForRepo.
	
	tests := classes select: #isTestCase.
	targets := classes reject: #isTestCase.

	self
		runMutalkTargets: targets
		tests: tests
		generationStrategy:
		SelectingFromCoverageMutationsGenerationStrategy new
]

{ #category : #'as yet unclassified' }
MutalkCI >> mutateDiff [

	| targets targetMethods tests classes |
	classes := self allClassesForRepo.
	targetMethods := self allChangesForRepo.
	

	tests := classes select: #isTestCase.
	targets := (targetMethods collect: #methodClass) asSet.
	targets ifEmpty: [ ^ self ].
	self
		runMutalkTargets: targets
		tests: tests
		generationStrategy:
		SelectingFromAlivesMutationsGenerationStrategy new
]

{ #category : #accessing }
MutalkCI >> project [

	^ project
]

{ #category : #accessing }
MutalkCI >> project: anObject [

	project := anObject
]

{ #category : #'as yet unclassified' }
MutalkCI >> recentCommit [

	commit := self getRepo head commit ancestors
		          ifNotEmpty: #first
		          ifEmpty: [ IceNoCommit new ]
]

{ #category : #private }
MutalkCI >> runMutalkTargets: targets tests: tests generationStrategy: generationStrategy [

	| analysis |
	analysis := MutationTestingAnalysis
		            testCasesFrom: tests
		            mutating: targets
		            using: MutantOperator contents
		            with: SelectingFromCoverageMutantEvaluationStrategy new
		            with: generationStrategy.
	analysis run.
	self exportResultJson: analysis
]
