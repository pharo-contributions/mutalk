Class {
	#name : #MutationTestingPercentRandomMutantsBudgetTest,
	#superclass : #TestCase,
	#instVars : [
		'budget',
		'analysis',
		'numberOfMutations'
	],
	#category : #'MuTalk-Tests'
}

{ #category : #running }
MutationTestingPercentRandomMutantsBudgetTest >> setUp [

	| testCases classesToMutate |
	super setUp.

	testCases := { AuxiliarClassForMutationTestingAnalysisTest }.
	classesToMutate := { AuxiliarClassForMutationTestingAnalysis }.

	budget := MutationTestingPercentRandomMutantsBudget new.

	analysis := MutationTestingAnalysis
		            testCasesFrom: testCases
		            mutating: classesToMutate
		            using: MutantOperator contents
		            with: AllTestsMethodsRunningTestSelectionStrategy new
		            with: AllMutantSelectionStrategy new
		            budget: budget.
	analysis generateMutations.
	numberOfMutations := analysis mutations size
]

{ #category : #tests }
MutationTestingPercentRandomMutantsBudgetTest >> test120Percent [

	budget constraint: 120.
	analysis run.
	self
		assert:
			analysis generalResult numberOfEvaluatedMutants / numberOfMutations
			* 100
		equals: 100
]

{ #category : #tests }
MutationTestingPercentRandomMutantsBudgetTest >> test20Percent [

	budget constraint: 20.
	analysis run.
	self
		assert:
			analysis generalResult numberOfEvaluatedMutants / numberOfMutations
			* 100
		equals: 20
]
