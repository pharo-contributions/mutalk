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

	stream close
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
MTStreamLogger >> logStartEvaluating: aMethodMutation [

	stream
		nextPutAll: 'Evaluating mutant of method ';
		nextPutAll: (self methodNameOf: aMethodMutation originalMethod);
		nextPutAll: '  with source:';
		cr;
		nextPutAll: aMethodMutation modifiedSource;
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
