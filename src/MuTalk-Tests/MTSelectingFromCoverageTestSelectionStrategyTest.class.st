Class {
	#name : 'MTSelectingFromCoverageTestSelectionStrategyTest',
	#superclass : 'MTTestSelectionStrategyTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'testing' }
MTSelectingFromCoverageTestSelectionStrategyTest class >> isAbstract [
	^ false
]

{ #category : 'asserting' }
MTSelectingFromCoverageTestSelectionStrategyTest >> assertMutantInCoverageOfTestCase [
	self assert: ((testCases collect: [ :each | each selector ]) includes: #testMethodThatCoverMethod1)
]

{ #category : 'asserting' }
MTSelectingFromCoverageTestSelectionStrategyTest >> assertMutantNotInCoverage [
	self assert: testCases isEmpty
]

{ #category : 'asserting' }
MTSelectingFromCoverageTestSelectionStrategyTest >> assertMutantNotInCoverageOfTest [
	self deny: ((testCases collect: [ :each | each selector ]) includes: #testMethodThatCoverMethod2)
]

{ #category : 'configuring' }
MTSelectingFromCoverageTestSelectionStrategyTest >> selectionStrategy [
	^ SelectingFromCoverageTestSelectionStrategy
]
