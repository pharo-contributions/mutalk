Class {
	#name : 'MTFixedNumberOfMutantsBudgetTest',
	#superclass : 'MTBudgetTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'running' }
MTFixedNumberOfMutantsBudgetTest >> runAnalysisFor: aNumber [

	^ self
		  runAnalysisWithBudget: (MTFixedNumberOfMutantsBudget for: aNumber)
		  on: { AuxiliarClassForMutationTestingAnalysis }
		  withTests: { AuxiliarClassForMutationTestingAnalysisTest }
]

{ #category : 'tests' }
MTFixedNumberOfMutantsBudgetTest >> testEvaluateAllMutantsWithConstraintGreaterThanActualNumberOfMutations [

	self runAnalysisFor: 50.
	self
		assert: analysis generalResult numberOfEvaluatedMutants
		equals: 25
]

{ #category : 'tests' }
MTFixedNumberOfMutantsBudgetTest >> testEvaluateTheCorrectNumberOfMutants [

	self runAnalysisFor: 10.
	self
		assert: analysis generalResult numberOfEvaluatedMutants
		equals: 10
]

{ #category : 'tests' }
MTFixedNumberOfMutantsBudgetTest >> testEvaluateZeroMutantsWithConstraintOfZero [

	self runAnalysisFor: 0.
	self
		assert: analysis generalResult numberOfEvaluatedMutants
		equals: 0
]

{ #category : 'tests' }
MTFixedNumberOfMutantsBudgetTest >> testEvaluateZeroMutantsWithNegativeConstraint [

	self runAnalysisFor: -10.
	self
		assert: analysis generalResult numberOfEvaluatedMutants
		equals: 0
]
