Class {
	#name : #MutationTestingFixedRandomMutantsBudgetTest,
	#superclass : #TestCase,
	#instVars : [
		'budget',
		'analysis'
	],
	#category : #'MuTalk-Tests'
}

{ #category : #running }
MutationTestingFixedRandomMutantsBudgetTest >> setUp [

	| testCases classesToMutate |
	super setUp.

	testCases := { AuxiliarClassForMutationTestingAnalysisTest }.
	classesToMutate := { AuxiliarClassForMutationTestingAnalysis }.

	budget := MutationTestingFixedRandomMutantsBudget new.

	analysis := MutationTestingAnalysis
		            testCasesFrom: testCases
		            mutating: classesToMutate
		            using: MutantOperator contents
		            with: AllTestsMethodsRunningTestSelectionStrategy new
		            with: AllMutantSelectionStrategy new
		            budget: budget
]

{ #category : #tests }
MutationTestingFixedRandomMutantsBudgetTest >> testEvaluateAllMutantsWithConstraintGreaterThanActualNumberOfMutations [

	budget constraint: 50.
	analysis run.
	self
		assert: analysis generalResult numberOfEvaluatedMutants
		equals: 25
]

{ #category : #tests }
MutationTestingFixedRandomMutantsBudgetTest >> testEvaluateTheCorrectNumberOfMutants [

	budget constraint: 10.
	analysis run.
	self
		assert: analysis generalResult numberOfEvaluatedMutants
		equals: 10
]

{ #category : #tests }
MutationTestingFixedRandomMutantsBudgetTest >> testEvaluateZeroMutantsWIthNegativeConstraint [

	budget constraint: -10.
	analysis run.
	self
		assert: analysis generalResult numberOfEvaluatedMutants
		equals: 0
]

{ #category : #tests }
MutationTestingFixedRandomMutantsBudgetTest >> testEvaluateZeroMutantsWithConstraintOfZero [

	budget constraint: 0.
	analysis run.
	self
		assert: analysis generalResult numberOfEvaluatedMutants
		equals: 0
]
