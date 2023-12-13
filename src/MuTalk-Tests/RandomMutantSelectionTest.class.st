Class {
	#name : 'RandomMutantSelectionTest',
	#superclass : 'TestCase',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'comparing' }
RandomMutantSelectionTest >> compareMutationsOf: mutations1 and: mutations2 [

	| mutant1 mutant2 |
	mutations1 size = mutations2 size ifFalse: [ ^ false ].
	1 to: mutations1 size do: [ :i |
		mutant1 := mutations1 at: i.
		mutant2 := mutations2 at: i.
		(mutant1 operator species = mutant2 operator species and: [
			 ( mutant1 originalMethod = mutant2 originalMethod ) and: [
				 mutant1 originalClass = mutant2 originalClass ] ]) ifFalse: [
			^ false ] ].
	^ true
]

{ #category : 'tests' }
RandomMutantSelectionTest >> testDefaultMutationsGenerationStrategyIsAllMutantSelectionStrategy [

	self
		assert: RandomMutantSelectionStrategy new mutationsGenerationStrategy species
		equals: AllMutantSelectionStrategy new species
]

{ #category : 'tests' }
RandomMutantSelectionTest >> testExecutingGenerateMutationsTwoTimesGivesTwoDifferentSetsOfMutations [

	| analysis mutations1 mutations2 |
	analysis := MutationTestingAnalysis
		            testCasesFrom:
		            { AuxiliarClassForMutationTestingAnalysisTest }
		            mutating: { AuxiliarClassForMutationTestingAnalysis }
		            using: MutantOperator contents
		            with: AllTestsMethodsRunningTestSelectionStrategy new
		            with: RandomMutantSelectionStrategy new.


	mutations1 := analysis generateMutations.
	"If there are already mutations for the analysis, it doesn't re-generate mutations, so we need to reset them"
	analysis mutations: nil.
	mutations2 := analysis generateMutations.

	self deny: (self compareMutationsOf: mutations1 and: mutations2)
]
