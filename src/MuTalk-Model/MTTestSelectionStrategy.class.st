Class {
	#name : 'MTTestSelectionStrategy',
	#superclass : 'Object',
	#category : 'MuTalk-Model-Test selection strategies',
	#package : 'MuTalk-Model',
	#tag : 'Test selection strategies'
}

{ #category : 'evaluating' }
MTTestSelectionStrategy >> testCasesToEvaluate: aMutation for: aMutantEvaluation [
	self subclassResponsibility
]

{ #category : 'evaluating' }
MTTestSelectionStrategy >> timeoutForTestsOf: aMutantEvaluation [
	^aMutantEvaluation coverageAnalysisResult timeToRunTests * 3
]
