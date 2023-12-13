Class {
	#name : 'RandomMutantSelectionTest',
	#superclass : 'TestCase',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
RandomMutantSelectionTest >> atLeastTwoDifferentMutantCollectionsIn: aCollection [

	| res |
	1 to: aCollection size - 1 do: [ :i |
		i + 1 to: aCollection size do: [ :j |
			(self sameMutationsIn: (aCollection at: i) and: (aCollection at: j))
				ifFalse: [ res := false ] ] ].
	res ifNil: [ res := true ].
	1halt.
	^ res
]

{ #category : 'comparing' }
RandomMutantSelectionTest >> sameMutationsIn: mutations1 and: mutations2 [

	| mutant1 mutant2 |
	mutations1 size = mutations2 size ifFalse: [ ^ false ].
	1 to: mutations1 size do: [ :i |
		mutant1 := mutations1 at: i.
		mutant2 := mutations2 at: i.
		mutant1 = mutant2 ifFalse: [
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

	| analysis mutationSet |
	"mutationSet is a set of collections of mutants"
	mutationSet := Set new.
	1 to: 5 do: [ :i | 1 halt.
		analysis := MutationTestingAnalysis
			            testCasesFrom:
			            { AuxiliarClassForMutationTestingAnalysisTest }
			            mutating: { AuxiliarClassForMutationTestingAnalysis }
			            using: MutantOperator contents
			            with: AllTestsMethodsRunningTestSelectionStrategy new
			            with: AllMutantSelectionStrategy new.

		mutationSet add: (analysis generateMutations at: 1)  ].

	self assert: mutationSet size equals: 25
]
