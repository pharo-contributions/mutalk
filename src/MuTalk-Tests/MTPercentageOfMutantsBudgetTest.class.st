Class {
	#name : #MTPercentageOfMutantsBudgetTest,
	#superclass : #MTBudgetTest,
	#instVars : [
		'numberOfMutations'
	],
	#category : 'MuTalk-Tests'
}

{ #category : #tests }
MTPercentageOfMutantsBudgetTest >> percentageOfEvaluatedMutants [

	^ analysis generalResult numberOfEvaluatedMutants
	  / analysis mutations size * 100
]

{ #category : #tests }
MTPercentageOfMutantsBudgetTest >> runAnalysisForPercentageOfMutants: aPercentage [

	self runAnalysisFor: (MTPercentageOfMutantsBudget for: aPercentage)
]

{ #category : #tests }
MTPercentageOfMutantsBudgetTest >> testEvaluateAllMutantsWithMoreThanOneHundredPercentConstraint [

	self runAnalysisForPercentageOfMutants: 120.
	self assert: self percentageOfEvaluatedMutants equals: 100
]

{ #category : #tests }
MTPercentageOfMutantsBudgetTest >> testEvaluateZeroPercentOfMutantsWithNegativePercentConstraint [

	self runAnalysisForPercentageOfMutants: -10.
	self assert: self percentageOfEvaluatedMutants equals: 0
]

{ #category : #tests }
MTPercentageOfMutantsBudgetTest >> testEvaluateZeroPercentOfMutantsWithZeroPercentConstraint [

	self runAnalysisForPercentageOfMutants: 0.
	self assert: self percentageOfEvaluatedMutants equals: 0
]

{ #category : #tests }
MTPercentageOfMutantsBudgetTest >> testExactPercentageOfMutants [

	self runAnalysisForPercentageOfMutants: 20.
	self assert: self percentageOfEvaluatedMutants equals: 20
]

{ #category : #tests }
MTPercentageOfMutantsBudgetTest >> testNonExactPercentageOfMutants [

	self runAnalysisForPercentageOfMutants: 21.
	self assert: self percentageOfEvaluatedMutants >= 21.
	self
		assert: analysis generalResult numberOfEvaluatedMutants
		equals: 6
]
