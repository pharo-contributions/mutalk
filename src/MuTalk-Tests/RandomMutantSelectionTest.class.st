Class {
	#name : 'RandomMutantSelectionTest',
	#superclass : 'TestCase',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'tests' }
RandomMutantSelectionTest >> testDefaultMutationsGenerationStrategy [

	self
		assert: RandomMutantSelectionStrategy new mutationsGenerationStrategy species
		equals: AllMutantSelectionStrategy new species
]
