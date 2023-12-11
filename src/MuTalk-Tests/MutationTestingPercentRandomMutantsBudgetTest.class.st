Class {
	#name : #MutationTestingPercentRandomMutantsBudgetTest,
	#superclass : #MutationTestingBudgetTest,
	#instVars : [
		'numberOfMutations'
	],
	#category : #'MuTalk-Tests'
}

{ #category : #running }
MutationTestingPercentRandomMutantsBudgetTest >> runAnalysisFor: aPercentage [

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
MutationTestingPercentRandomMutantsBudgetTest >> testEvaluateAllMutantsWithMoreThanOneHundredPercentConstraint [

	self runAnalysisFor: 120.
	self
		assert:
			analysis generalResult numberOfEvaluatedMutants / numberOfMutations * 100
		equals: 100
]

{ #category : #tests }
MutationTestingPercentRandomMutantsBudgetTest >> testEvaluateTheCorrectPercentageOfMutants [

	self runAnalysisFor: 20.
	self
		assert:
			analysis generalResult numberOfEvaluatedMutants / numberOfMutations * 100
		equals: 20
]

{ #category : #tests }
MutationTestingPercentRandomMutantsBudgetTest >> testEvaluateZeroPercentOfMutantsWithNegativePercentConstraint [

	self runAnalysisFor: -10.
	self
		assert:
			analysis generalResult numberOfEvaluatedMutants / numberOfMutations * 100
		equals: 0
]

{ #category : #tests }
MutationTestingPercentRandomMutantsBudgetTest >> testEvaluateZeroPercentOfMutantsWithZeroPercentConstraint [

	self runAnalysisFor: 0.
	self
		assert:
			analysis generalResult numberOfEvaluatedMutants / numberOfMutations * 100
		equals: 0
]
