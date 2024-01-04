Class {
	#name : 'SelectingFromCoverageTestSelectionStrategyTest',
	#superclass : 'TestSelectionStrategyTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'testing' }
SelectingFromCoverageTestSelectionStrategyTest class >> isAbstract [
	^ false
]

{ #category : 'asserting' }
SelectingFromCoverageTestSelectionStrategyTest >> assertMutantInCoverageOfTestCase [
	self assert: ((testCases collect: [ :each | each selector ]) includes: #testMethodThatCoverMethod1)
]

{ #category : 'asserting' }
SelectingFromCoverageTestSelectionStrategyTest >> assertMutantNotInCoverage [
	self assert: testCases isEmpty
]

{ #category : 'asserting' }
SelectingFromCoverageTestSelectionStrategyTest >> assertMutantNotInCoverageOfTest [
	self deny: ((testCases collect: [ :each | each selector ]) includes: #testMethodThatCoverMethod2)
]

{ #category : 'configuring' }
SelectingFromCoverageTestSelectionStrategyTest >> selectionStrategy [
	^ SelectingFromCoverageTestSelectionStrategy
]
