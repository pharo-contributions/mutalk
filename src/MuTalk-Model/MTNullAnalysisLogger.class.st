Class {
	#name : 'MTNullAnalysisLogger',
	#superclass : 'MTAnalysisLogger',
	#classInstVars : [
		'instance'
	],
	#category : 'MuTalk-Model-Logging',
	#package : 'MuTalk-Model',
	#tag : 'Logging'
}

{ #category : 'instance creation' }
MTNullAnalysisLogger class >> new [
	instance ifNil:[instance := super new.].
	^instance.
]

{ #category : 'logging' }
MTNullAnalysisLogger >> logAnalysisStartFor: aMutationTestingAnalysis [ 
]

{ #category : 'logging' }
MTNullAnalysisLogger >> logStartBuildingMutantionsFor: aCompiledMethod using: aMutantOperator [
]

{ #category : 'logging' }
MTNullAnalysisLogger >> logStartEvaluating: aMethodMutation [ 
]
