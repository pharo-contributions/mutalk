Class {
	#name : 'MTBudgetTest',
	#superclass : 'TestCase',
	#instVars : [
		'analysis'
	],
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'testing' }
MTBudgetTest class >> isAbstract [

	^ self == MTBudgetTest
]

{ #category : 'running' }
MTBudgetTest >> runAnalysisFor: aBudget [

	^ self
		  runAnalysisWithBudget: aBudget
		  on: { AuxiliarClassForMutationTestingAnalysis }
		  withTests: { AuxiliarClassForMutationTestingAnalysisTest }
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
