Class {
	#name : #MTAllTestsMethodsRunningTestSelectionStrategy,
	#superclass : #MTTestSelectionStrategy,
	#category : 'MuTalk-Model-Test selection strategies'
}

{ #category : #private }
MTAllTestsMethodsRunningTestSelectionStrategy >> testCasesToEvaluate: aMutation for: aMutantEvaluation [
	^aMutantEvaluation testCases.
	
]
