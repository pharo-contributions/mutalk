Class {
	#name : #SelectingFromCoverageMutantEvaluationStrategyTest,
	#superclass : #MutantEvaluationStrategyTest,
	#category : #'MuTalk-Tests'
}

{ #category : #testing }
SelectingFromCoverageMutantEvaluationStrategyTest class >> isAbstract [
	^ false
]

{ #category : #asserting }
SelectingFromCoverageMutantEvaluationStrategyTest >> assertMutantInCoverageOfTestCase [
	self assert: ((testCases collect: [ :each | each selector ]) includes: #testMethodThatCoverMethod1)
]

{ #category : #asserting }
SelectingFromCoverageMutantEvaluationStrategyTest >> assertMutantNotInCoverage [
	self assert: testCases isEmpty
]

{ #category : #asserting }
SelectingFromCoverageMutantEvaluationStrategyTest >> assertMutantNotInCoverageOfTest [
	self deny: ((testCases collect: [ :each | each selector ]) includes: #testMethodThatCoverMethod2)
]

{ #category : #configuring }
SelectingFromCoverageMutantEvaluationStrategyTest >> selectionStrategy [
	^ SelectingFromCoverageTestSelectionStrategy
]
