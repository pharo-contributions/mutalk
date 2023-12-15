Class {
	#name : 'MutationTestingPercentageOfMutantsBudgetTest',
	#superclass : 'MutationTestingBudgetTest',
	#instVars : [
		'numberOfMutations'
	],
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'tests' }
MutationTestingPercentageOfMutantsBudgetTest >> testExactPercentageOfMutants [

	self runAnalysisFor: 20.
	self
		assert:
			analysis generalResult numberOfEvaluatedMutants / numberOfMutations * 100
		equals: 20
]

{ #category : 'tests' }
MutationTestingPercentageOfMutantsBudgetTest >> testNonExactPercentageOfMutants [

	self runAnalysisFor: 21.
	self assert:
		analysis generalResult numberOfEvaluatedMutants / numberOfMutations * 100 >= 21.
	self
		assert: analysis generalResult numberOfEvaluatedMutants
		equals: 6
]
