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
MTStreamLogger >> logAnalysisStartFor: aMutationTestingAnalysis [

	stream
		nextPutAll: 'The analysis is starting...';
		cr
]

{ #category : 'logging' }
MTStreamLogger >> logEnd [

	stream
		nextPutAll: 'The analysis is finished';
		close
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
		nextPutAll: '  with operator:';
		nextPutAll: aMutantOperator description;
		cr
]

{ #category : 'logging' }
MTStreamLogger >> logStartCoverageAnalysis [

	stream
		nextPutAll: 'Starting coverage analysis';
		cr
]

{ #category : 'logging' }
MTStreamLogger >> logStartEvaluating: aMethodMutation [

	stream
		nextPutAll: 'Evaluating mutant of method ';
		nextPutAll: (self methodNameOf: aMethodMutation originalMethod);
		nextPutAll: '  with source:';
		cr;
		nextPutAll: aMethodMutation modifiedSource;
		cr
]

{ #category : 'logging' }
MTStreamLogger >> logStartMutationEvaluation [

	stream
		nextPutAll: 'Starting mutation evaluation';
		cr
]

{ #category : 'logging' }
MTStreamLogger >> logStartMutationGeneration [

	stream
		nextPutAll: 'Starting mutation generation';
		cr
]

{ #category : 'logging' }
MTStreamLogger >> logTotalNumberOfMutations: aNumber [

	stream
		nextPutAll: aNumber asString;
		nextPutAll: ' total mutations generated';
		cr
]

{ #category : 'private' }
MTStreamLogger >> methodNameOf: aCompiledMethod [

	^ aCompiledMethod methodClass name asString , '>>'
	  , aCompiledMethod selector printString
]

{ #category : 'accessing' }
MTStreamLogger >> stream [

	^ stream
]

{ #category : 'accessing' }
MTStreamLogger >> stream: anObject [

	stream := anObject
]
