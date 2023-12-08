Class {
	#name : 'AllTestsMethodsRunningTestSelectionStrategy',
	#superclass : 'TestSelectionStrategy',
	#category : 'MuTalk-Model-Mutant evaluation strategies',
	#package : 'MuTalk-Model',
	#tag : 'Mutant evaluation strategies'
}

{ #category : 'private' }
AllTestsMethodsRunningTestSelectionStrategy >> testCasesToEvaluate: aMutation for: aMutantEvaluation [
	^aMutantEvaluation testCases.
	
]
