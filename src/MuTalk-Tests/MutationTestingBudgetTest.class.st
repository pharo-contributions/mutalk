Class {
	#name : #MutationTestingBudgetTest,
	#superclass : #TestCase,
	#instVars : [
		'analysis'
	],
	#category : #'MuTalk-Tests'
}

{ #category : #running }
MutationTestingBudgetTest >> runAnalysisFor: aConstraint [

	^ self subclassResponsibility
]

{ #category : #running }
MutationTestingBudgetTest >> runAnalysisWithBudget: aBudget on: classesToMutate withTests: testCases [

	analysis := MutationTestingAnalysis
		            testCasesFrom: testCases
		            mutating: classesToMutate
		            using: MutantOperator contents
		            with: AllTestsMethodsRunningTestSelectionStrategy new
		            with: AllMutantSelectionStrategy new
		            budget: aBudget.

	analysis run.
	^ analysis generalResult
]
