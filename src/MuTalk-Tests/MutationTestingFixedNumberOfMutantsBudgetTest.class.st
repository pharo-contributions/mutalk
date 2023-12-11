Class {
	#name : #MutationTestingFixedNumberOfMutantsBudgetTest,
	#superclass : #MutationTestingBudgetTest,
	#category : #'MuTalk-Tests'
}

{ #category : #running }
MutationTestingFixedNumberOfMutantsBudgetTest >> runAnalysisFor: aNumber [

	^ self
		  runAnalysisWithBudget: (MutationTestingFixedNumberOfMutantsBudget for: aNumber)
		  on: { AuxiliarClassForMutationTestingAnalysis }
		  withTests: { AuxiliarClassForMutationTestingAnalysisTest }
]

{ #category : #tests }
MutationTestingFixedNumberOfMutantsBudgetTest >> testEvaluateAllMutantsWithConstraintGreaterThanActualNumberOfMutations [

	self runAnalysisFor: 50.
	self
		assert: analysis generalResult numberOfEvaluatedMutants
		equals: 25
]

{ #category : #tests }
MutationTestingFixedNumberOfMutantsBudgetTest >> testEvaluateTheCorrectNumberOfMutants [

	self runAnalysisFor: 10.
	self
		assert: analysis generalResult numberOfEvaluatedMutants
		equals: 10
]

{ #category : #tests }
MutationTestingFixedNumberOfMutantsBudgetTest >> testEvaluateZeroMutantsWithConstraintOfZero [

	self runAnalysisFor: 0.
	self
		assert: analysis generalResult numberOfEvaluatedMutants
		equals: 0
]

{ #category : #tests }
MutationTestingFixedNumberOfMutantsBudgetTest >> testEvaluateZeroMutantsWithNegativeConstraint [

	self runAnalysisFor: -10.
	self
		assert: analysis generalResult numberOfEvaluatedMutants
		equals: 0
]
