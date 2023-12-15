Class {
	#name : 'MTPercentageOfMutantsBudgetTest',
	#superclass : 'MTBudgetTest',
	#instVars : [
		'numberOfMutations'
	],
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'running' }
MTPercentageOfMutantsBudgetTest >> runAnalysisFor: aPercentage [

	| result |
	result := self
		          runAnalysisWithBudget:
		          (MTPercentageOfMutantsBudget for: aPercentage)
		          on: { AuxiliarClassForMutationTestingAnalysis }
		          withTests: { AuxiliarClassForMutationTestingAnalysisTest }.
	numberOfMutations := analysis mutations size.
	^ result
]

{ #category : 'tests' }
MTPercentageOfMutantsBudgetTest >> testEvaluateAllMutantsWithMoreThanOneHundredPercentConstraint [

	self runAnalysisFor: 120.
	self
		assert:
			analysis generalResult numberOfEvaluatedMutants / numberOfMutations * 100
		equals: 100
]

{ #category : 'tests' }
MTPercentageOfMutantsBudgetTest >> testEvaluateZeroPercentOfMutantsWithNegativePercentConstraint [

	self runAnalysisFor: -10.
	self
		assert:
			analysis generalResult numberOfEvaluatedMutants / numberOfMutations * 100
		equals: 0
]

{ #category : 'tests' }
MTPercentageOfMutantsBudgetTest >> testEvaluateZeroPercentOfMutantsWithZeroPercentConstraint [

	self runAnalysisFor: 0.
	self
		assert:
			analysis generalResult numberOfEvaluatedMutants / numberOfMutations * 100
		equals: 0
]

{ #category : 'tests' }
MTPercentageOfMutantsBudgetTest >> testExactPercentageOfMutants [

	self runAnalysisFor: 20.
	self
		assert:
			analysis generalResult numberOfEvaluatedMutants / numberOfMutations * 100
		equals: 20
]

{ #category : 'tests' }
MTPercentageOfMutantsBudgetTest >> testNonExactPercentageOfMutants [

	self runAnalysisFor: 21.
	self assert:
		analysis generalResult numberOfEvaluatedMutants / numberOfMutations * 100 >= 21.
	self
		assert: analysis generalResult numberOfEvaluatedMutants
		equals: 6
]
