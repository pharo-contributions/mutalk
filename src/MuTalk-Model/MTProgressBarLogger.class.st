Class {
	#name : 'MTProgressBarLogger',
	#superclass : 'MTAnalysisLogger',
	#instVars : [
		'mainJob',
		'testJob',
		'mutantJob',
		'methodJob'
	],
	#category : 'MuTalk-Model-Logging',
	#package : 'MuTalk-Model',
	#tag : 'Logging'
}

{ #category : 'initialization' }
MTProgressBarLogger >> initialize [

	mainJob := Job new.
	SystemVersion current major <= 10 ifTrue: [
		"Jobs need a block below P10 to have an owner?"
		mainJob block: [ ].
	].
	mainJob
		min: 0;
		max: 4.
	mainJob title: 'Mutation Analysis: '
]

{ #category : 'initialization' }
MTProgressBarLogger >> initializeMethodJob: size [

	methodJob := Job new
		             min: 0;
		             max: size;
		             yourself.

	SystemVersion current major <= 10 ifTrue: [
		"Jobs need a block below P10 to have an owner?"
		methodJob block: [  ] ].
	
	methodJob prepareForRunning
]

{ #category : 'initialization' }
MTProgressBarLogger >> initializeMutantJob: size [

	mutantJob := Job new
		             min: 0;
		             max: size;
		             yourself.

	SystemVersion current major <= 10 ifTrue: [
		"Jobs need a block below P10 to have an owner?"
		mutantJob block: [  ] ].
	
	mutantJob prepareForRunning
]

{ #category : 'initialization' }
MTProgressBarLogger >> initializeTestJob: size [

	testJob := Job new
		           min: 0;
		           max: size;
		           yourself.

	SystemVersion current major <= 10 ifTrue: [
		"Jobs need a block below P10 to have an owner?"
		testJob block: [ ].
	].

	testJob prepareForRunning
]

{ #category : 'logging' }
MTProgressBarLogger >> logAnalysisStart [

	mainJob prepareForRunning
]

{ #category : 'logging' }
MTProgressBarLogger >> logEnd [

	mainJob title: 'Mutation Testing: Finished'.
	mainJob cleanupAfterRunning.
	mainJob := nil
]

{ #category : 'logging' }
MTProgressBarLogger >> logEndCoverageAnalysis [

	self testJob cleanupAfterRunning.
	mainJob increment.
	testJob := nil
]

{ #category : 'logging' }
MTProgressBarLogger >> logEndEvaluating [

	self testJob cleanupAfterRunning.
	self mutantJob increment.
	testJob := nil
]

{ #category : 'logging' }
MTProgressBarLogger >> logEndInitialTestRun [

	self testJob cleanupAfterRunning.
	mainJob increment.
	testJob := nil
]

{ #category : 'logging' }
MTProgressBarLogger >> logEndMutationEvaluation [

	self mutantJob cleanupAfterRunning.
	mutantJob := nil.
	mainJob increment
]

{ #category : 'logging' }
MTProgressBarLogger >> logEndMutationGeneration [

	self methodJob cleanupAfterRunning.
	methodJob := nil.
	mainJob increment
]

{ #category : 'logging' }
MTProgressBarLogger >> logNumberOfGeneratedMutations: aNumber [

	"[ :job |
	aNumber < 2
		ifTrue: [ job title: aNumber asString , ' mutation generated' ]
		ifFalse: [ job title: aNumber asString , ' mutations generated' ] ]
		asJob run"
]

{ #category : 'logging' }
MTProgressBarLogger >> logRunningTest: aTestCaseReference [

	self testJob title:
		'Running mutated test: ' , aTestCaseReference testCase printString.
	self testJob increment
]

{ #category : 'logging' }
MTProgressBarLogger >> logStartBuildingMutantionsFor: aCompiledMethod using: aMutantOperator [

	self methodJob title:
		'Generating mutations for ' , (self methodNameOf: aCompiledMethod)
		, ' with operator: ' , aMutantOperator description.
	self methodJob increment
]

{ #category : 'logging' }
MTProgressBarLogger >> logStartCoverageAnalysis: testSize [

	mainJob title: 'Mutation Testing: Starting coverage analysis'.
	self initializeTestJob: testSize
]

{ #category : 'logging' }
MTProgressBarLogger >> logStartEvaluating: aMethodMutation with: testSize [

	self mutantJob title: 'Evaluating ' , aMethodMutation printString.
	self initializeTestJob: testSize
]

{ #category : 'logging' }
MTProgressBarLogger >> logStartInitialTestRun: testSize [

	mainJob title: 'Mutation Testing: Initial test run'.
	self initializeTestJob: testSize
]

{ #category : 'logging' }
MTProgressBarLogger >> logStartMutationEvaluation: mutants [

	mainJob title: 'Mutation Testing: Evaluating mutants'.
	self initializeMutantJob: mutants size
]

{ #category : 'logging' }
MTProgressBarLogger >> logStartMutationGeneration: methodSize [

	mainJob title: 'Mutation Testing: Generating mutants'.
	self initializeMethodJob: methodSize
]

{ #category : 'logging' }
MTProgressBarLogger >> logTotalNumberOfMutations: mutations [

	"[ :job |
	job title: mutations size asString , ' total mutations generated' ]
		asJob run"
]

{ #category : 'accessing' }
MTProgressBarLogger >> methodJob [

	^ methodJob
]

{ #category : 'accessing' }
MTProgressBarLogger >> mutantJob [

	^ mutantJob
]

{ #category : 'dependencies' }
MTProgressBarLogger >> release [

	methodJob ifNotNil: [ self methodJob cleanupAfterRunning ].
	mutantJob ifNotNil: [ self mutantJob cleanupAfterRunning ].
	testJob ifNotNil: [ self testJob cleanupAfterRunning ].
	mainJob ifNotNil: [ mainJob cleanupAfterRunning ]
]

{ #category : 'accessing' }
MTProgressBarLogger >> testJob [

	^ testJob
]
