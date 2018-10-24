Class {
	#name : #AllTestsMethodsRunningMutantEvaluationStrategy,
	#superclass : #MutantEvaluationStrategy,
	#category : 'MuTalk-Model-Mutant evaluation strategies'
}

{ #category : #private }
AllTestsMethodsRunningMutantEvaluationStrategy >> testCasesToEvaluate: aMutation for: aMutantEvaluation [
	^aMutantEvaluation testCases.
	
]
