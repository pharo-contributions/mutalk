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

	| testCases classesToMutate mutations mutStream |
	super setUp.

	testCases := { AuxiliarTestClassForMutationTestingBudget }.
	classesToMutate := { AuxiliarClassForMutationTestingBudget }.

	budget := MutationTestingTimeBudget new.

	analysis := MutationTestingAnalysis
		            testCasesFrom: testCases
		            mutating: classesToMutate
		            using: MutantOperator contents
		            with: AllTestsMethodsRunningTestSelectionStrategy new
		            with: AllMutantSelectionStrategy new.
	analysis run.
	mutations := analysis mutations.

	mutStream := InfiniteReadStream on: mutations.
	analysis mutations: mutStream.

	analysis := MutationTestingAnalysis
		            testCasesFrom: testCases
		            mutating: classesToMutate
		            using: MutantOperator contents
		            with: AllTestsMethodsRunningTestSelectionStrategy new
		            with: AllMutantSelectionStrategy new
		            budget: budget.
	analysis mutations: mutStream
]

{ #category : #tests }
MutationTestingTimeBudgetTest >> test2Seconds [

	| duration |
	duration := Duration seconds: 2.
	budget constraint: duration.
	self assert:
		[ analysis run ] timeToRun - duration <= (Duration seconds: 0.1)
]

{ #category : #tests }
MutationTestingTimeBudgetTest >> testPoint5Seconds [

	| duration |
	duration := Duration seconds: 0.5.
	budget constraint: duration.
	self assert:
		[ analysis run ] timeToRun - duration <= (Duration seconds: 0.1)
]
