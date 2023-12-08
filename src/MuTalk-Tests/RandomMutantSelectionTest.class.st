Class {
	#name : #RandomMutantSelectionTest,
	#superclass : #TestCase,
	#category : #'MuTalk-Tests'
}

{ #category : #comparing }
RandomMutantSelectionTest >> compareMutationsOf: mutations1 and: mutations2 [

	| mutant1 mutant2 |
	mutations1 size = mutations2 size ifFalse: [ ^ false ].
	1 to: mutations1 size do: [ :i |
		mutant1 := mutations1 at: i.
		mutant2 := mutations2 at: i.
		(mutant1 operator species = mutant2 operator species and: [
			 [ mutant1 originalMethod = mutant2 originalMethod ] and: [
				 mutant1 originalClass = mutant2 originalClass ] ]) ifFalse: [
			^ false ] ].
	^ true
]

{ #category : #tests }
RandomMutantSelectionTest >> testDefaultMutationsGenerationStrategy [

	self
		assert: RandomMutantSelectionStrategy new mutationsGenerationStrategy species
		equals: AllMutantSelectionStrategy new species
]

{ #category : #tests }
RandomMutantSelectionTest >> testDifferentMutations [

	| analysis mutations1 mutations2 |
	analysis := MutationTestingAnalysis
		            testCasesFrom:
		            { AuxiliarClassForMutationTestingAnalysisTest }
		            mutating: { AuxiliarClassForMutationTestingAnalysis }
		            using: MutantOperator contents
		            with: AllTestsMethodsRunningTestSelectionStrategy new
		            with: RandomMutantSelectionStrategy new.

	analysis generateMutations.
	mutations1 := analysis mutations.
	analysis generateMutations.
	mutations2 := analysis mutations.

	self deny: (self compareMutationsOf: mutations1 and: mutations2)
]
