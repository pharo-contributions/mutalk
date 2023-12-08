Class {
	#name : 'NullMutationTestingAnalysisLogger',
	#superclass : 'MutationTestingAnalysisLogger',
	#classInstVars : [
		'instance'
	],
	#category : 'MuTalk-Model-Logging',
	#package : 'MuTalk-Model',
	#tag : 'Logging'
}

{ #category : 'instance creation' }
NullMutationTestingAnalysisLogger class >> new [
	instance ifNil:[instance := super new.].
	^instance.
]

{ #category : 'logging' }
NullMutationTestingAnalysisLogger >> logAnalysisStartFor: aMutationTestingAnalysis [ 
]

{ #category : 'logging' }
NullMutationTestingAnalysisLogger >> logStartBuildingMutantionsFor: aCompiledMethod using: aMutantOperator [
]

{ #category : 'logging' }
NullMutationTestingAnalysisLogger >> logStartEvaluating: aMethodMutation [ 
]
