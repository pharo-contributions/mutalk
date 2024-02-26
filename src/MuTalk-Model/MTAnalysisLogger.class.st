Class {
	#name : #MTAnalysisLogger,
	#superclass : #Object,
	#category : 'MuTalk-Model-Logging'
}

{ #category : #logging }
MTAnalysisLogger >> logAnalysisStartFor: aMutationTestingAnalysis [ 
	self subclassResponsibility 
]

{ #category : #logging }
MTAnalysisLogger >> logStartBuildingMutantionsFor: aCompiledMethod using: aMutantOperator [
	self subclassResponsibility 
]

{ #category : #logging }
MTAnalysisLogger >> logStartEvaluating: aMethodMutation [ 
	self subclassResponsibility
]
