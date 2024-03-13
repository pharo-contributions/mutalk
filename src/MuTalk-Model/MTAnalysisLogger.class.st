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
MTAnalysisLogger >> logNumberOfGeneratedMutations: aNumber [

	^ self subclassResponsibility
]

{ #category : 'logging' }
MTAnalysisLogger >> logRunningTest: aTestCaseReference [

	self subclassResponsibility
]

{ #category : 'logging' }
MTAnalysisLogger >> logStartBuildingMutantionsFor: aCompiledMethod using: aMutantOperator [
	self subclassResponsibility 
]

{ #category : 'logging' }
MTAnalysisLogger >> logStartCoverageAnalysis [

	^ self subclassResponsibility
]

{ #category : 'logging' }
MTAnalysisLogger >> logStartEvaluating: aMethodMutation [ 
	self subclassResponsibility
]

{ #category : 'logging' }
MTAnalysisLogger >> logStartMutationEvaluation [

	^ self subclassResponsibility
]

{ #category : 'logging' }
MTAnalysisLogger >> logStartMutationGeneration [

	^ self subclassResponsibility
]

{ #category : 'logging' }
MTAnalysisLogger >> logTotalNumberOfMutations: mutations [

	^ self subclassResponsibility
]
