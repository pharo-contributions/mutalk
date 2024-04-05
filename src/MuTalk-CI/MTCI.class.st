Class {
	#name : 'MTCI',
	#superclass : 'Object',
	#instVars : [
		'project',
		'commit'
	],
	#category : 'MuTalk-CI',
	#package : 'MuTalk-CI'
}

{ #category : 'as yet unclassified' }
MTCI >> allChangesForRepo [
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

{ #category : 'private' }
MTCI >> allClassesForRepo [

	| repo |
	repo := self getRepo.
	^ (repo workingCopy packages select: [ :p | p isLoaded ]) 
		  flatCollect: [ :p | 
		  p package asPackage definedClasses asOrderedCollection ]
]

{ #category : 'accessing' }
MTCI >> commit [

	^ commit
]

{ #category : 'accessing' }
MTCI >> commit: anObject [

	commit := anObject
]

{ #category : 'private' }
MTCI >> exportFileName [
	^ '__mutalk_export.json'
]

{ #category : 'private' }
MTCI >> exportResultJson: analysis [

	| json file repo commitFrom commitTo timestamp |
	repo := self getRepo.
	commitFrom := commit.
	commitTo := repo head commit id.
	timestamp := DateAndTime now asUnixTime.

	json := MTCITonelJsonExporter new
		        mtResult: analysis;
		        commit: commitTo;
		        root: repo subdirectory;
		        cloneLocation: repo location fullName;
		        export.
	file := FileLocator imageDirectory / self exportFileName.
	file exists ifTrue: [ file delete ].
	file writeStream
		nextPutAll: json;
		close
]

{ #category : 'private' }
MTCI >> exportResultJson: analysis coverageInfo: coverageInfo [

	| json file repo commitFrom commitTo timestamp |
	repo := self getRepo.
	commitFrom := commit.
	commitTo := repo head commit id.
	timestamp := DateAndTime now asUnixTime.

	json := MTCITonelJsonExporter new
		        mtResult: analysis;
		        commit: commitTo;
		coverageInfo: coverageInfo;
		        root: repo subdirectory;
		        cloneLocation: repo location fullName;
		        export.
	file := FileLocator imageDirectory / self exportFileName.
	file exists ifTrue: [ file delete ].
	file writeStream
		nextPutAll: json;
		close
]

{ #category : 'as yet unclassified' }
MTCI >> getRepo [

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

{ #category : 'as yet unclassified' }
MTCI >> mutateAll [

	| classes tests targets |
	classes := self allClassesForRepo.
	
	tests := classes select: #isTestCase.
	targets := classes reject: #isTestCase.

	self
		runMutalkTargets: targets
		tests: tests
		generationStrategy:
		MTSelectingFromCoverageMutantGenerationStrategy new
]

{ #category : 'as yet unclassified' }
MTCI >> mutateDiff [

	| targets targetMethods tests classes |
	classes := self allClassesForRepo.
	targetMethods := self allChangesForRepo.


	tests := classes select: #isTestCase.
	targets := (targetMethods collect: #methodClass) asSet.
	targets ifEmpty: [ ^ self ].
	self
		runMutalkTargets: targets
		tests: tests
		generationStrategy: MTSelectingFromAlivesMutantGenerationStrategy new
]

{ #category : 'as yet unclassified' }
MTCI >> prepareCoverageInfo: anAnalyse [

	^ MTCoveragePropagationPreparation new
		mtResult: anAnalyse;
		prepare
]

{ #category : 'accessing' }
MTCI >> project [

	^ project
]

{ #category : 'accessing' }
MTCI >> project: anObject [

	project := anObject
]

{ #category : 'as yet unclassified' }
MTCI >> recentCommit [

	commit := self getRepo head commit ancestors
		          ifNotEmpty: #first
		          ifEmpty: [ IceNoCommit new ]
]

{ #category : 'private' }
MTCI >> runMutalkTargets: targets tests: tests generationStrategy: generationStrategy [

	| analysis coverageInfo |
	analysis := MTAnalysis new
		            testClasses: tests;
		            classesToMutate: targets;
		            testSelectionStrategy:
			            MTSelectingFromCoverageTestSelectionStrategy new;
		            mutantGenerationStrategy: generationStrategy.
	analysis run.
	coverageInfo := self prepareCoverageInfo: analysis.
	self exportResultJson: analysis coverageInfo: coverageInfo
]
