Class {
	#name : #MTRandomMutantSelectionStrategyTest,
	#superclass : #TestCase,
	#category : 'MuTalk-Tests'
}

{ #category : #accessing }
MTRandomMutantSelectionStrategyTest >> classToTest [

	^ MTRandomMutantSelectionStrategy
]

{ #category : #tests }
MTRandomMutantSelectionStrategyTest >> testAtLeastTwoDifferentMutantCollectionsAmongFive [
	"This test is to ensure that RandomMutantSelectionStrategy doesn't always produce the same mutant collections.
	If it can produce at least two different collections, we assume it correctly randomize the inital mutant collection.
	Here, two mutant collections are differents when their mutants are not in the same order."

	| analysis mutationsSet |
	"mutationsSet is a set of mutant collections"
	mutationsSet := Set new.
	1 to: 5 do: [ :i |
		analysis := MTAnalysis new
			            testClasses:
				            { MTAuxiliarClassForMTAnalysisTest };
			            classesToMutate:
				            { MTAuxiliarClassForMTAnalysis };
			            mutantSelectionStrategy: self classToTest new.
		mutationsSet add: analysis generateMutations ].

	"If the size of the set is at least 2, there is at least 2 different mutant collections, so at least 2 different orders of mutants."
	self assert: mutationsSet size >= 2
]

{ #category : #tests }
MTRandomMutantSelectionStrategyTest >> testDefaultMutantSelectionStrategyIsAllMutantSelectionStrategy [

	self
		assert: self classToTest new mutantSelectionStrategy species
		equals: MTAllMutantSelectionStrategy new species
]
