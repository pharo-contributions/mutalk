Class {
	#name : #MutationTestingFixedRandomMutantsBudgetTest,
	#superclass : #MutationTestingBudgetTest,
	#category : #'MuTalk-Tests'
}

{ #category : #running }
MutationTestingFixedRandomMutantsBudgetTest >> runAnalysisFor: aNumber [

	^ self
		  runAnalysisWithBudget: (MutationTestingFixedNumberOfMutantsBudget for: aNumber)
		  on: { AuxiliarClassForMutationTestingAnalysis }
		  withTests: { AuxiliarClassForMutationTestingAnalysisTest }
]

{ #category : #tests }
MutationTestingFixedRandomMutantsBudgetTest >> testEvaluateAllMutantsWithConstraintGreaterThanActualNumberOfMutations [

	self runAnalysisFor: 50.
	self
		assert: analysis generalResult numberOfEvaluatedMutants
		equals: 25
]

{ #category : #tests }
MutationTestingFixedRandomMutantsBudgetTest >> testEvaluateTheCorrectNumberOfMutants [

	self runAnalysisFor: 10.
	self
		assert: analysis generalResult numberOfEvaluatedMutants
		equals: 10
]

{ #category : #tests }
MutationTestingFixedRandomMutantsBudgetTest >> testEvaluateZeroMutantsWithConstraintOfZero [

	self runAnalysisFor: 0.
	self
		assert: analysis generalResult numberOfEvaluatedMutants
		equals: 0
]

{ #category : #tests }
MutationTestingFixedRandomMutantsBudgetTest >> testEvaluateZeroMutantsWithNegativeConstraint [

	self runAnalysisFor: -10.
	self
		assert: analysis generalResult numberOfEvaluatedMutants
		equals: 0
]
