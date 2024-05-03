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
MTNullLogger >> logAnalysisStart [ 
]

{ #category : 'logging' }
MTNullLogger >> logEnd [

	
]

{ #category : 'logging' }
MTNullLogger >> logEndCoverageAnalysis [

	
]

{ #category : 'logging' }
MTNullLogger >> logEndEvaluating [

	
]

{ #category : 'logging' }
MTNullLogger >> logEndInitialTestRun [

	
]

{ #category : 'logging' }
MTNullLogger >> logEndMutationEvaluation [

	
]

{ #category : 'logging' }
MTNullLogger >> logEndMutationGeneration [

	
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
MTNullLogger >> logStartCoverageAnalysis: testSize [

	
]

{ #category : 'logging' }
MTNullLogger >> logStartEvaluating: aMethodMutation [ 
]

{ #category : 'logging' }
MTNullLogger >> logStartEvaluating: aMethodMutation with: testSize [

	
]

{ #category : 'logging' }
MTNullLogger >> logStartInitialTestRun: testSize [

	
]

{ #category : 'logging' }
MTNullLogger >> logStartMutationEvaluation: mutants [

	
]

{ #category : 'logging' }
MTNullLogger >> logStartMutationGeneration [

	
]

{ #category : 'logging' }
MTNullLogger >> logStartMutationGeneration: methodSize [

	
]

{ #category : 'logging' }
MTNullLogger >> logTotalNumberOfMutations: mutations [

	
]
