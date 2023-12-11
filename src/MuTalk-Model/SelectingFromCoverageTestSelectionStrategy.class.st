Class {
	#name : #SelectingFromCoverageTestSelectionStrategy,
	#superclass : #TestSelectionStrategy,
	#category : #'MuTalk-Model-Test selection strategies'
}

{ #category : #private }
SelectingFromCoverageTestSelectionStrategy >> testCasesToEvaluate: aMutation for: aMutantEvaluation [  
	^ aMutantEvaluation coverageAnalysisResult testCasesThatCovers: aMutation originalMethod
]
