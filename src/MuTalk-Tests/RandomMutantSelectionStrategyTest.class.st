Class {
	#name : 'RandomMutantSelectionStrategyTest',
	#superclass : 'TestCase',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'comparing' }
RandomMutantSelectionStrategyTest >> atLeastTwoDifferentMutantCollectionsIn: aCollection [
	"aCollection is a collection of mutant collections. This method returns true if among these mutant collections, at least 2 are differents."

	1 to: aCollection size - 1 do: [ :i |
		i + 1 to: aCollection size do: [ :j |
	"By iterating like this, we ensure to compare each mutant collection with every other collections
	For example, when i = 1, 2 <= j <= 5, when i = 2, 3 <= j <= 5 (collection 2 and collection 1 have already been compared previously), etc"
			(self
				 sameMutationOrderIn: (aCollection at: i)
				 and: (aCollection at: j)) ifFalse: [ ^ true ] ] ].
	^ false
]

{ #category : 'comparing' }
RandomMutantSelectionStrategyTest >> sameMutationOrderIn: mutantCollection1 and: mutantCollection2 [
	"Compares the order of the mutants in 2 mutant collections. The mutants may be the same in both collections, but we check if they are in the same order
	Returns true if they are in the same order, else false"

	| mutant1 mutant2 |
	mutantCollection1 size = mutantCollection2 size ifFalse: [ ^ false ].
	1 to: mutantCollection1 size do: [ :i |
		mutant1 := mutantCollection1 at: i.
		mutant2 := mutantCollection2 at: i.
		mutant1 = mutant2 ifFalse: [ ^ false ] ].
	^ true
]

{ #category : 'tests' }
RandomMutantSelectionStrategyTest >> testAtLeastTwoDifferentMutantCollectionsAmongFive [
	"Here, two mutant collections are differents when their mutants are not in the same order"

	| analysis mutationsCollection |
	"mutationsCollection is a collection of mutant collections"
	mutationsCollection := OrderedCollection new.
	1 to: 5 do: [ :i |
		analysis := MutationTestingAnalysis
			            testCasesFrom:
			            { AuxiliarClassForMutationTestingAnalysisTest }
			            mutating: { AuxiliarClassForMutationTestingAnalysis }
			            using: MutantOperator contents
			            with: AllTestsMethodsRunningTestSelectionStrategy new
			            with: RandomMutantSelectionStrategy new.
		mutationsCollection add: analysis generateMutations ].

	self assert:
		(self atLeastTwoDifferentMutantCollectionsIn: mutationsCollection)
]

{ #category : 'tests' }
RandomMutantSelectionStrategyTest >> testDefaultMutationsGenerationStrategyIsAllMutantSelectionStrategy [

	self
		assert: RandomMutantSelectionStrategy new mutationsGenerationStrategy species
		equals: AllMutantSelectionStrategy new species
]
