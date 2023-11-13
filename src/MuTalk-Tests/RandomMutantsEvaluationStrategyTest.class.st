Class {
	#name : #RandomMutantsEvaluationStrategyTest,
	#superclass : #TestCase,
	#category : #'MuTalk-Tests'
}

{ #category : #tests }
RandomMutantsEvaluationStrategyTest >> testDefaultMutationsGenerationStrategy [

	self
		assert: RandomMutantsEvaluationStrategy new mutationsEvaluationStrategy species
		equals: AllMutationsGenerationStrategy new species
]
