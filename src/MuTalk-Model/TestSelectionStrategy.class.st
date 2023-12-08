Class {
	#name : 'TestSelectionStrategy',
	#superclass : 'Object',
	#category : 'MuTalk-Model-Mutant evaluation strategies',
	#package : 'MuTalk-Model',
	#tag : 'Mutant evaluation strategies'
}

{ #category : 'evaluating' }
TestSelectionStrategy >> testCasesToEvaluate: aMutation for: aMutantEvaluation [
	self subclassResponsibility
]

{ #category : 'evaluating' }
TestSelectionStrategy >> timeoutForTestsOf: aMutantEvaluation [
	^aMutantEvaluation coverageAnalysisResult timeToRunTests * 3
]
