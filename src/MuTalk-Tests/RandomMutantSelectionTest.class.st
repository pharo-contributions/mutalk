Class {
	#name : #RandomMutantSelectionTest,
	#superclass : #TestCase,
	#category : #'MuTalk-Tests'
}

{ #category : #tests }
RandomMutantSelectionTest >> testDefaultMutationsGenerationStrategy [

	self
		assert: RandomMutantSelection new mutationsGenerationStrategy species
		equals: AllMutationsGenerationStrategy new species
]
