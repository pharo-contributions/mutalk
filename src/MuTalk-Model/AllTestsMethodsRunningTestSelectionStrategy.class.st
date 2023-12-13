Class {
	#name : 'AllTestsMethodsRunningTestSelectionStrategy',
	#superclass : 'TestSelectionStrategy',
	#category : 'MuTalk-Model-Test selection strategies',
	#package : 'MuTalk-Model',
	#tag : 'Test selection strategies'
}

{ #category : 'private' }
AllTestsMethodsRunningTestSelectionStrategy >> testCasesToEvaluate: aMutation for: aMutantEvaluation [
	^aMutantEvaluation testCases.
	
]
