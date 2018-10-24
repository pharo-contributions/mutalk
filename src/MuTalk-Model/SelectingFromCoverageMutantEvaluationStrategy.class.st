Class {
	#name : #SelectingFromCoverageMutantEvaluationStrategy,
	#superclass : #MutantEvaluationStrategy,
	#category : 'MuTalk-Model-Mutant evaluation strategies'
}

{ #category : #private }
SelectingFromCoverageMutantEvaluationStrategy >> testCasesToEvaluate: aMutation for: aMutantEvaluation [  
	^ aMutantEvaluation coverageAnalysisResult testCasesThatCovers: aMutation originalMethod
]
