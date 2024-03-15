Class {
	#name : #MTAllTestsMethodsRunningTestSelectionStrategyTest,
	#superclass : #MTTestSelectionStrategyTest,
	#category : 'MuTalk-Tests'
}

{ #category : #testing }
MTAllTestsMethodsRunningTestSelectionStrategyTest class >> isAbstract [
	^ false
]

{ #category : #asserting }
MTAllTestsMethodsRunningTestSelectionStrategyTest >> assertForAllMutants [
	self assert: testCases size equals: testCasesUsed size
]

{ #category : #asserting }
MTAllTestsMethodsRunningTestSelectionStrategyTest >> assertMutantInCoverageOfTestCase [
	self assertForAllMutants
]

{ #category : #asserting }
MTAllTestsMethodsRunningTestSelectionStrategyTest >> assertMutantNotInCoverage [
	self assertForAllMutants
]

{ #category : #asserting }
MTAllTestsMethodsRunningTestSelectionStrategyTest >> assertMutantNotInCoverageOfTest [
	self assertForAllMutants
]

{ #category : #configuring }
MTAllTestsMethodsRunningTestSelectionStrategyTest >> selectionStrategy [
	^ MTAllTestsMethodsRunningTestSelectionStrategy
]
