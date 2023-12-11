Class {
	#name : #MutationTestingPercentageOfMutantsBudgetTest,
	#superclass : #MutationTestingBudgetTest,
	#instVars : [
		'numberOfMutations'
	],
	#category : #'MuTalk-Tests'
}

{ #category : #running }
MutationTestingPercentageOfMutantsBudgetTest >> runAnalysisFor: aPercentage [

	| result |
	result := self
		          runAnalysisWithBudget:
		          (MutationTestingPercentageOfMutantsBudget for: aPercentage)
		          on: { AuxiliarClassForMutationTestingAnalysis }
		          withTests: { AuxiliarClassForMutationTestingAnalysisTest }.
	numberOfMutations := analysis mutations size.
	^ result
]

{ #category : #tests }
MutationTestingPercentageOfMutantsBudgetTest >> testEvaluateAllMutantsWithMoreThanOneHundredPercentConstraint [

	self runAnalysisFor: 120.
	self
		assert:
			analysis generalResult numberOfEvaluatedMutants / numberOfMutations * 100
		equals: 100
]

{ #category : #tests }
MutationTestingPercentageOfMutantsBudgetTest >> testEvaluateTheCorrectPercentageOfMutants [

	self runAnalysisFor: 20.
	self
		assert:
			analysis generalResult numberOfEvaluatedMutants / numberOfMutations * 100
		equals: 20
]

{ #category : #tests }
MutationTestingPercentageOfMutantsBudgetTest >> testEvaluateZeroPercentOfMutantsWithNegativePercentConstraint [

	self runAnalysisFor: -10.
	self
		assert:
			analysis generalResult numberOfEvaluatedMutants / numberOfMutations * 100
		equals: 0
]

{ #category : #tests }
MutationTestingPercentageOfMutantsBudgetTest >> testEvaluateZeroPercentOfMutantsWithZeroPercentConstraint [

	self runAnalysisFor: 0.
	self
		assert:
			analysis generalResult numberOfEvaluatedMutants / numberOfMutations * 100
		equals: 0
]
