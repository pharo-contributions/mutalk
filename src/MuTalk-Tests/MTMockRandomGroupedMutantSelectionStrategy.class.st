Class {
	#name : 'MTMockRandomGroupedMutantSelectionStrategy',
	#superclass : 'MTRandomGroupedMutantSelectionStrategy',
	#instVars : [
		'random',
		'randomGroupedMutantSelectionStrategy'
	],
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'instance creation' }
MTMockRandomGroupedMutantSelectionStrategy class >> for: aRandomGroupedMutantSelectionStrategy andSeed: aSeed [

	^ self new
		  randomGroupedMutantSelectionStrategy:
			  aRandomGroupedMutantSelectionStrategy;
		  random: (Random seed: aSeed)
]

{ #category : 'enumerating' }
MTMockRandomGroupedMutantSelectionStrategy >> groupCondition [

	^ randomGroupedMutantSelectionStrategy groupCondition
]

{ #category : 'generating' }
MTMockRandomGroupedMutantSelectionStrategy >> mutationsFor: aMutationTestingAnalysis loggingIn: aLogger [

	| mutations shuffledMutations mutationDict |
	mutations := mutationsGenerationStrategy
		             mutationsFor: aMutationTestingAnalysis
		             loggingIn: aLogger.

	"Invariant: mutationsDict values are never empty.
	If they were to be empty, we remove the entry from the dictionary."
	mutationDict := mutations groupedBy: self groupCondition.
	mutationDict := mutationDict collect: [ :mutationList |
		                (mutationList shuffleBy: random) readStream ].

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
MTMockRandomGroupedMutantSelectionStrategy >> random [

	^ random
]

{ #category : 'accessing' }
MTMockRandomGroupedMutantSelectionStrategy >> random: anObject [

	random := anObject
]

{ #category : 'accessing' }
MTMockRandomGroupedMutantSelectionStrategy >> randomGroupedMutantSelectionStrategy [

	^ randomGroupedMutantSelectionStrategy
]

{ #category : 'accessing' }
MTMockRandomGroupedMutantSelectionStrategy >> randomGroupedMutantSelectionStrategy: anObject [

	randomGroupedMutantSelectionStrategy := anObject
]
