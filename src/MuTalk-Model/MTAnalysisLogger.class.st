Class {
	#name : 'MTAnalysisLogger',
	#superclass : 'Object',
	#category : 'MuTalk-Model-Logging',
	#package : 'MuTalk-Model',
	#tag : 'Logging'
}

{ #category : 'logging' }
MTAnalysisLogger >> logAnalysisStartFor: aMutationTestingAnalysis [ 
	self subclassResponsibility 
]

{ #category : 'logging' }
MTAnalysisLogger >> logEnd [

	^ self subclassResponsibility
]

{ #category : 'logging' }
MTAnalysisLogger >> logStartBuildingMutantionsFor: aCompiledMethod using: aMutantOperator [
	self subclassResponsibility 
]

{ #category : 'logging' }
MTAnalysisLogger >> logStartEvaluating: aMethodMutation [ 
	self subclassResponsibility
]
