Class {
	#name : 'MTBudgetTest',
	#superclass : 'TestCase',
	#instVars : [
		'analysis'
	],
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'running' }
MTBudgetTest >> runAnalysisFor: aConstraint [

	^ self subclassResponsibility
]

{ #category : 'running' }
MTBudgetTest >> runAnalysisWithBudget: aBudget on: classesToMutate withTests: testCases [

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
