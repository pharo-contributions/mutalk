Class {
	#name : #MutalkCI,
	#superclass : #Object,
	#instVars : [
		'project',
		'commit',
		'result'
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

	|repo|
	repo := self getRepo.
	^ (repo workingCopy packages select: [ :p | p isLoaded ]) 
					  flatCollect: [ :p | 
					  repo package asPackage definedClasses asOrderedCollection]
	

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

	| json file repo |
	repo := self getRepo.
	json := MutalkCITonelJsonExporter new
		        mtResult: analysis;
		        commit: commit;
		        pull_request_id: '???';
		        root: repo entity project sourceDirectory;
		        cloneLocation: repo location fullName;
		        export.
	file := FileLocator imageDirectory / self exportFileName.
	file exists ifTrue: [ file delete ].
	file writeStream writeStream
		nextPutAll: json;
		close
]

{ #category : #'as yet unclassified' }
MutalkCI >> getRepo [

	Smalltalk at: #IceRepository ifPresent: [ :clsIceRepository | 
		clsIceRepository registry
			detect: [ :r | r name = project ]
			ifFound: [ :r | ^ r ]
			ifNone: [ | gitClone |
				gitClone := Smalltalk os environment asDictionary at: #GITHUB_WORKSPACE ifAbsent: [ 'GITHUB_WORKSPACE missing' traceCr. Smalltalk exitFailure ].

				IceRepository registry
					detect: [ :r | r name = project ]
					ifNone: [ |r tmp|
		   					r := IceRepositoryCreator new
									repository: nil;
									location: gitClone asFileReference.
   	           			r := r createRepository.
		   					r register.
		   ]. 
	] ].

	self error: 'repo not installed. ' , project
]

{ #category : #'as yet unclassified' }
MutalkCI >> mutateAll [

	| classes tests targets |
	classes := self allClassesForRepo.
	self prepareResult.
	tests := classes select: #isTestCase.
	targets := classes reject: #isTestCase.

	self
		runMutalkTargets: targets
		tests: tests
		generationStrategy:
		SelectingFromCoverageMutationsGenerationStrategy new.
	
]

{ #category : #'as yet unclassified' }
MutalkCI >> mutateDiff [

	| targets targetMethods tests classes |
	classes := self allClassesForRepo.
	targetMethods := self allChangesForRepo.
	self prepareResult.

	tests := classes select: #isTestCase.
	targets := (targetMethods collect: #methodClass) asSet.
	targets ifEmpty: [ ^ self ].
	self
		runMutalkTargets: targets
		tests: tests
		generationStrategy:
		SelectingFromAlivesMutationsGenerationStrategy new
]

{ #category : #'as yet unclassified' }
MutalkCI >> prepareResult [

	result := Dictionary new.
	result
		at: 'commitFrom'
		put: commit .
	result at: 'commitTo' put: self getRepo head commit id.
	result at: 'timestamp' put: DateAndTime now asUnixTime
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
