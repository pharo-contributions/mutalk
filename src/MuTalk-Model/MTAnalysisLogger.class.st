Class {
	#name : 'MTAnalysisLogger',
	#superclass : 'Object',
	#category : 'MuTalk-Model-Logging',
	#package : 'MuTalk-Model',
	#tag : 'Logging'
}

{ #category : 'logging' }
MTAnalysisLogger >> logAnalysisStart [ 
	self subclassResponsibility 
]

{ #category : 'logging' }
MTAnalysisLogger >> logEnd [

	^ self subclassResponsibility
]

{ #category : 'logging' }
MTAnalysisLogger >> logEndCoverageAnalysis [

	^ self subclassResponsibility
]

{ #category : 'logging' }
MTAnalysisLogger >> logEndEvaluating [

	self subclassResponsibility
]

{ #category : 'logging' }
MTAnalysisLogger >> logEndInitialTestRun [

	self subclassResponsibility
]

{ #category : 'logging' }
MTAnalysisLogger >> logEndMutationEvaluation [

	self subclassResponsibility
]

{ #category : 'logging' }
MTAnalysisLogger >> logEndMutationGeneration [

	self subclassResponsibility
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
MTAnalysisLogger >> logStartCoverageAnalysis: testSize [

	^ self subclassResponsibility
]

{ #category : 'logging' }
MTAnalysisLogger >> logStartEvaluating: aMethodMutation with: testSize [

	self subclassResponsibility
]

{ #category : 'logging' }
MTAnalysisLogger >> logStartInitialTestRun: testSize [

	self subclassResponsibility
]

{ #category : 'logging' }
MTAnalysisLogger >> logStartMutationEvaluation: mutants [

	^ self subclassResponsibility
]

{ #category : 'logging' }
MTAnalysisLogger >> logStartMutationGeneration: methodSize [

	^ self subclassResponsibility
]

{ #category : 'logging' }
MTAnalysisLogger >> logTotalNumberOfMutations: mutations [

	^ self subclassResponsibility
]

{ #category : 'private' }
MTAnalysisLogger >> methodNameOf: aCompiledMethod [

	^ aCompiledMethod methodClass name asString , '>>'
	  , aCompiledMethod selector printString
]
