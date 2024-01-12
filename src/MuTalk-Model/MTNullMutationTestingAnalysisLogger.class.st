Class {
	#name : 'MTNullMutationTestingAnalysisLogger',
	#superclass : 'MTAnalysisLogger',
	#classInstVars : [
		'instance'
	],
	#category : 'MuTalk-Model-Logging',
	#package : 'MuTalk-Model',
	#tag : 'Logging'
}

{ #category : 'instance creation' }
MTNullMutationTestingAnalysisLogger class >> new [
	instance ifNil:[instance := super new.].
	^instance.
]

{ #category : 'logging' }
MTNullMutationTestingAnalysisLogger >> logAnalysisStartFor: aMutationTestingAnalysis [ 
]

{ #category : 'logging' }
MTNullMutationTestingAnalysisLogger >> logStartBuildingMutantionsFor: aCompiledMethod using: aMutantOperator [
]

{ #category : 'logging' }
MTNullMutationTestingAnalysisLogger >> logStartEvaluating: aMethodMutation [ 
]
