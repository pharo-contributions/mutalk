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
MTNullLogger >> logStartBuildingMutantionsFor: aCompiledMethod using: aMutantOperator [
]

{ #category : 'logging' }
MTNullLogger >> logStartEvaluating: aMethodMutation [ 
]
