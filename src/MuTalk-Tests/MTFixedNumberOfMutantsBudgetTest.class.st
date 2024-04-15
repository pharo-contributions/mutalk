Class {
	#name : 'MTFixedNumberOfMutantsBudgetTest',
	#superclass : 'MTBudgetTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'tests' }
MTFixedNumberOfMutantsBudgetTest >> runAnalysisForFixedNumberOfMutants: aNumber [

	self runAnalysisFor: (MTFixedNumberOfMutantsBudget for: aNumber)
]

{ #category : 'tests' }
MTFixedNumberOfMutantsBudgetTest >> testEvaluateAllMutantsWithConstraintGreaterThanActualNumberOfMutations [

	self runAnalysisForFixedNumberOfMutants: 100.
	self
		assert: analysis generalResult numberOfEvaluatedMutants
		equals: 96
]

{ #category : 'tests' }
MTFixedNumberOfMutantsBudgetTest >> testEvaluateTheCorrectNumberOfMutants [

	self runAnalysisForFixedNumberOfMutants: 10.
	self
		assert: analysis generalResult numberOfEvaluatedMutants
		equals: 10
]

{ #category : 'tests' }
MTFixedNumberOfMutantsBudgetTest >> testEvaluateZeroMutantsWithConstraintOfZero [

	self runAnalysisForFixedNumberOfMutants: 0.
	self
		assert: analysis generalResult numberOfEvaluatedMutants
		equals: 0
]

{ #category : 'tests' }
MTFixedNumberOfMutantsBudgetTest >> testEvaluateZeroMutantsWithNegativeConstraint [

	self runAnalysisForFixedNumberOfMutants: -10.
	self
		assert: analysis generalResult numberOfEvaluatedMutants
		equals: 0
]
