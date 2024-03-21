Class {
	#name : 'MTMockRandomMethodMutantSelectionStrategy',
	#superclass : 'MTRandomMethodMutantSelectionStrategy',
	#instVars : [
		'random'
	],
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'instance creation' }
MTMockRandomMethodMutantSelectionStrategy class >> for: aSeed [

	^ self new random: (Random seed: aSeed)
]

{ #category : 'generating' }
MTMockRandomMethodMutantSelectionStrategy >> mutationsFor: aMutationTestingAnalysis loggingIn: aLogger [

	| mutations shuffledMutations mutationDict |
	mutations := mutationsGenerationStrategy
		             mutationsFor: aMutationTestingAnalysis
		             loggingIn: aLogger.

	"Invariant: mutationsDict values are never empty.
	If they were to be empty, we remove the entry from the dictionary."
	mutationDict := mutations groupedBy: self groupCondition.
	mutationDict := mutationDict collect: [ :mutationList |
		                (mutationList shuffledBy: random) readStream ].

	shuffledMutations := OrderedCollection new.
	1 to: mutations size do: [ :i |
		| key streamValue |
		key := mutationDict keys atRandom.
		streamValue := mutationDict at: key.
		shuffledMutations add: streamValue next.
		streamValue atEnd ifTrue: [ mutationDict removeKey: key ] ].

	^ shuffledMutations
]

{ #category : 'accessing' }
MTMockRandomMethodMutantSelectionStrategy >> random [

	^ random
]

{ #category : 'accessing' }
MTMockRandomMethodMutantSelectionStrategy >> random: anObject [

	random := anObject
]
