Class {
	#name : 'MTStreamLogger',
	#superclass : 'MTAnalysisLogger',
	#instVars : [
		'stream'
	],
	#category : 'MuTalk-Model-Logging',
	#package : 'MuTalk-Model',
	#tag : 'Logging'
}

{ #category : 'initialization' }
MTStreamLogger >> initialize [

	super initialize.
	self initializeStream
]

{ #category : 'initialization' }
MTStreamLogger >> initializeStream [

	^ self subclassResponsibility
]

{ #category : 'logging' }
MTStreamLogger >> logAnalysisStart [

	stream
		nextPutAll: 'The analysis is starting';
		cr
]

{ #category : 'logging' }
MTStreamLogger >> logEnd [

	stream
		nextPutAll: 'The analysis is finished';
		close
]

{ #category : 'logging' }
MTStreamLogger >> logEndCoverageAnalysis [

	stream
		nextPutAll: 'Coverage analysis finished';
		cr
]

{ #category : 'logging' }
MTStreamLogger >> logEndEvaluating [

	
]

{ #category : 'logging' }
MTStreamLogger >> logEndInitialTestRun [

	stream
		nextPutAll: 'Initial test run finished';
		cr
]

{ #category : 'logging' }
MTStreamLogger >> logEndMutationEvaluation [

	stream
		nextPutAll: 'Mutant evaluation finished';
		cr
]

{ #category : 'logging' }
MTStreamLogger >> logEndMutationGeneration [

	stream
		nextPutAll: 'Mutant generation finished';
		cr
]

{ #category : 'logging' }
MTStreamLogger >> logNumberOfGeneratedMutations: aNumber [

	stream
		nextPutAll: aNumber asString;
		nextPutAll: (aNumber < 2
				 ifTrue: [ ' mutation generated' ]
				 ifFalse: [ ' mutations generated' ]);
		cr
]

{ #category : 'logging' }
MTStreamLogger >> logRunningTest: aTestCaseReference [

	stream
		nextPutAll: 'Running test: ';
		nextPutAll: aTestCaseReference testCase printString;
		cr
]

{ #category : 'logging' }
MTStreamLogger >> logStartBuildingMutantionsFor: aCompiledMethod using: aMutantOperator [

	stream
		nextPutAll: 'Generating mutations for ';
		nextPutAll: (self methodNameOf: aCompiledMethod);
		nextPutAll: ' with operator:';
		nextPutAll: aMutantOperator description;
		cr
]

{ #category : 'logging' }
MTStreamLogger >> logStartCoverageAnalysis: testSize [

	stream
		nextPutAll: 'Starting coverage analysis';
		cr
]

{ #category : 'logging' }
MTStreamLogger >> logStartEvaluating: aMethodMutation with: testSize [

	stream
		nextPutAll: 'Evaluating ';
		nextPutAll: aMethodMutation printString;
		nextPutAll: ' with source:';
		cr;
		nextPutAll: aMethodMutation modifiedSource;
		cr
]

{ #category : 'logging' }
MTStreamLogger >> logStartInitialTestRun: testSize [

	stream
		nextPutAll: 'Starting initial test run';
		cr
]

{ #category : 'logging' }
MTStreamLogger >> logStartMutationEvaluation: mutants [

	stream
		nextPutAll: 'Starting mutation evaluation';
		cr
]

{ #category : 'logging' }
MTStreamLogger >> logStartMutationGeneration: methodSize [

	stream
		nextPutAll: 'Starting mutation generation';
		cr
]

{ #category : 'logging' }
MTStreamLogger >> logTotalNumberOfMutations: mutations [

	stream
		nextPutAll: mutations size asString;
		nextPutAll: ' total mutations generated';
		cr
]

{ #category : 'accessing' }
MTStreamLogger >> stream [

	^ stream
]

{ #category : 'accessing' }
MTStreamLogger >> stream: anObject [

	stream := anObject
]
