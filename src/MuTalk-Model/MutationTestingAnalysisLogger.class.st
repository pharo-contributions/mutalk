Class {
	#name : #MutationTestingAnalysisLogger,
	#superclass : #Object,
	#category : 'MuTalk-Model-Logging'
}

{ #category : #logging }
MutationTestingAnalysisLogger >> logAnalysisStartFor: aMutationTestingAnalysis [ 
	self subclassResponsibility 
]

{ #category : #logging }
MutationTestingAnalysisLogger >> logStartBuildingMutantionsFor: aCompiledMethod using: aMutantOperator [
	self subclassResponsibility 
]

{ #category : #logging }
MutationTestingAnalysisLogger >> logStartEvaluating: aMethodMutation [ 
	self subclassResponsibility
]
