Class {
	#name : 'MTMockRandomClassMutantSelectionStrategy',
	#superclass : 'MTRandomClassMutantSelectionStrategy',
	#instVars : [
		'random'
	],
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'instance creation' }
MTMockRandomClassMutantSelectionStrategy class >> for: aSeed [

	^ self new random: (Random seed: aSeed)
]

{ #category : 'generating' }
MTMockRandomClassMutantSelectionStrategy >> mutationsFor: aMutationTestingAnalysis loggingIn: aLogger [

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
		key := mutationDict keys atRandom: random.
		streamValue := mutationDict at: key.
		shuffledMutations add: streamValue next.
		streamValue atEnd ifTrue: [ mutationDict removeKey: key ] ].

	^ shuffledMutations
]

{ #category : 'accessing' }
MTMockRandomClassMutantSelectionStrategy >> random [

	^ random
]

{ #category : 'accessing' }
MTMockRandomClassMutantSelectionStrategy >> random: anObject [

	random := anObject
]
