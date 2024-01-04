Class {
	#name : 'AllTestsMethodsRunningTestSelectionStrategyTest',
	#superclass : 'TestSelectionStrategyTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'testing' }
AllTestsMethodsRunningTestSelectionStrategyTest class >> isAbstract [
	^ false
]

{ #category : 'asserting' }
AllTestsMethodsRunningTestSelectionStrategyTest >> assertForAllMutants [
	self assert: testCases size equals: testCasesUsed size
]

{ #category : 'asserting' }
AllTestsMethodsRunningTestSelectionStrategyTest >> assertMutantInCoverageOfTestCase [
	self assertForAllMutants
]

{ #category : 'asserting' }
AllTestsMethodsRunningTestSelectionStrategyTest >> assertMutantNotInCoverage [
	self assertForAllMutants
]

{ #category : 'asserting' }
AllTestsMethodsRunningTestSelectionStrategyTest >> assertMutantNotInCoverageOfTest [
	self assertForAllMutants
]

{ #category : 'configuring' }
AllTestsMethodsRunningTestSelectionStrategyTest >> selectionStrategy [
	^ AllTestsMethodsRunningTestSelectionStrategy
]
