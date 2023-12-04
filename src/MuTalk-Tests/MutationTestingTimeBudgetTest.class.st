Class {
	#name : #MutationTestingTimeBudgetTest,
	#superclass : #TestCase,
	#instVars : [
		'budget',
		'analysis'
	],
	#category : #'MuTalk-Tests'
}

{ #category : #running }
MutationTestingTimeBudgetTest >> setUp [

	| testCases classesToMutate |
	super setUp.

	testCases := { AuxiliarTestClassForMutationTestingBudget }.
	classesToMutate := { AuxiliarClassForMutationTestingBudget }.

	budget := MutationTestingTimeBudget new.

	analysis := MutationTestingAnalysis
		            testCasesFrom: testCases
		            mutating: classesToMutate
		            using: MutantOperator contents
		            with: AllTestsMethodsRunningTestSelectionStrategy new
		            with: AllMutantSelectionStrategy new
		            budget: budget
]

{ #category : #tests }
MutationTestingTimeBudgetTest >> test12SecShouldEvaluate2Mutants [

	budget constraint: (Duration seconds: 12).
	analysis run.
	self
		assert: analysis generalResult numberOfEvaluatedMutants
		equals: 2
]

{ #category : #tests }
MutationTestingTimeBudgetTest >> test13SecShouldEvaluate3Mutants [

	budget constraint: (Duration seconds: 13).
	analysis run.
	self
		assert: analysis generalResult numberOfEvaluatedMutants
		equals: 3
]

{ #category : #tests }
MutationTestingTimeBudgetTest >> test30SecShouldEvaluate4Mutants [

	budget constraint: (Duration seconds: 30).
	analysis run.
	self
		assert: analysis generalResult numberOfEvaluatedMutants
		equals: 4
]
