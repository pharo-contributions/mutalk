Class {
	#name : 'MTNullLogger',
	#superclass : 'MTAnalysisLogger',
	#classInstVars : [
		'instance'
	],
	#category : 'MuTalk-Model-Logging',
	#package : 'MuTalk-Model',
	#tag : 'Logging'
}

{ #category : 'instance creation' }
MTNullLogger class >> new [
	instance ifNil:[instance := super new.].
	^instance.
]

{ #category : 'logging' }
MTNullLogger >> logAnalysisStartFor: aMutationTestingAnalysis [ 
]

{ #category : 'logging' }
MTNullLogger >> logEnd [

	
]

{ #category : 'logging' }
MTNullLogger >> logNumberOfGeneratedMutations: aNumber [

	
]

{ #category : 'logging' }
MTNullLogger >> logRunningTest: aTestCaseReference [

	
]

{ #category : 'logging' }
MTNullLogger >> logStartBuildingMutantionsFor: aCompiledMethod using: aMutantOperator [
]

{ #category : 'logging' }
MTNullLogger >> logStartCoverageAnalysis [

	
]

{ #category : 'logging' }
MTNullLogger >> logStartEvaluating: aMethodMutation [ 
]

{ #category : 'logging' }
MTNullLogger >> logStartMutationEvaluation [

	
]

{ #category : 'logging' }
MTNullLogger >> logStartMutationGeneration [

	
]

{ #category : 'logging' }
MTNullLogger >> logTotalNumberOfMutations: mutations [

	
]
