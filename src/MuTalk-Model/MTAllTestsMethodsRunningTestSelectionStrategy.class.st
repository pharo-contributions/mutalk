Class {
	#name : 'MTAllTestsMethodsRunningTestSelectionStrategy',
	#superclass : 'MTTestSelectionStrategy',
	#category : 'MuTalk-Model-Test selection strategies',
	#package : 'MuTalk-Model',
	#tag : 'Test selection strategies'
}

{ #category : 'private' }
MTAllTestsMethodsRunningTestSelectionStrategy >> testCasesToEvaluate: aMutation for: aMutantEvaluation [
	^aMutantEvaluation testCases.
	
]
