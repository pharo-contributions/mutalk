Class {
	#name : #AllTestsMethodsRunningTestSelectionStrategy,
	#superclass : #TestSelectionStrategy,
	#category : #'MuTalk-Model-Test selection strategies'
}

{ #category : #private }
AllTestsMethodsRunningTestSelectionStrategy >> testCasesToEvaluate: aMutation for: aMutantEvaluation [
	^aMutantEvaluation testCases.
	
]
