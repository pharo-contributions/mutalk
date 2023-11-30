Class {
	#name : #SelectingFromCoverageTestSelectionStrategy,
	#superclass : #TestSelectionStrategy,
	#category : #'MuTalk-Model-Mutant evaluation strategies'
}

{ #category : #private }
SelectingFromCoverageTestSelectionStrategy >> testCasesToEvaluate: aMutation for: aMutantEvaluation [  
	^ aMutantEvaluation coverageAnalysisResult testCasesThatCovers: aMutation originalMethod
]
