Class {
	#name : 'AllTestsMethodsRunningMutantEvaluationStrategyTest',
	#superclass : 'MutantEvaluationStrategyTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'testing' }
AllTestsMethodsRunningMutantEvaluationStrategyTest class >> isAbstract [
	^ false
]

{ #category : 'asserting' }
AllTestsMethodsRunningMutantEvaluationStrategyTest >> assertForAllMutants [
	self assert: testCases size equals: testCasesUsed size
]

{ #category : 'asserting' }
AllTestsMethodsRunningMutantEvaluationStrategyTest >> assertMutantInCoverageOfTestCase [
	self assertForAllMutants
]

{ #category : 'asserting' }
AllTestsMethodsRunningMutantEvaluationStrategyTest >> assertMutantNotInCoverage [
	self assertForAllMutants
]

{ #category : 'asserting' }
AllTestsMethodsRunningMutantEvaluationStrategyTest >> assertMutantNotInCoverageOfTest [
	self assertForAllMutants
]

{ #category : 'configuring' }
AllTestsMethodsRunningMutantEvaluationStrategyTest >> selectionStrategy [
	^ AllTestsMethodsRunningTestSelectionStrategy
]
