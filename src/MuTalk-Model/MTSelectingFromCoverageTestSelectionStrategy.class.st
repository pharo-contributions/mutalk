Class {
	#name : #MTSelectingFromCoverageTestSelectionStrategy,
	#superclass : #MTTestSelectionStrategy,
	#category : 'MuTalk-Model-Test selection strategies'
}

{ #category : #private }
MTSelectingFromCoverageTestSelectionStrategy >> testCasesToEvaluate: aMutation for: aMutantEvaluation [  
	^ aMutantEvaluation coverageAnalysisResult testCasesThatCovers: aMutation originalMethod
]
