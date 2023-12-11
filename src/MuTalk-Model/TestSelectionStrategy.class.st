Class {
	#name : #TestSelectionStrategy,
	#superclass : #Object,
	#category : #'MuTalk-Model-Test selection strategies'
}

{ #category : #evaluating }
TestSelectionStrategy >> testCasesToEvaluate: aMutation for: aMutantEvaluation [
	self subclassResponsibility
]

{ #category : #evaluating }
TestSelectionStrategy >> timeoutForTestsOf: aMutantEvaluation [
	^aMutantEvaluation coverageAnalysisResult timeToRunTests * 3
]
