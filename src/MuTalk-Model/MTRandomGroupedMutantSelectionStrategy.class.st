Class {
	#name : 'MTRandomGroupedMutantSelectionStrategy',
	#superclass : 'MTRandomMutantSelectionStrategy',
	#instVars : [
		'randomGenerator'
	],
	#category : 'MuTalk-Model-Mutant selection strategies',
	#package : 'MuTalk-Model',
	#tag : 'Mutant selection strategies'
}

{ #category : 'testing' }
MTRandomGroupedMutantSelectionStrategy class >> isAbstract [

	^ self == MTRandomGroupedMutantSelectionStrategy
]

{ #category : 'instance creation' }
MTRandomGroupedMutantSelectionStrategy class >> withSeed: aSeed [

	^ self new
		  randomGenerator: (Random seed: aSeed);
		  yourself
]

{ #category : 'enumerating' }
MTRandomGroupedMutantSelectionStrategy >> groupCondition [

	^ self subclassResponsibility
]

{ #category : 'initialization' }
MTRandomGroupedMutantSelectionStrategy >> initialize [

	super initialize.
	randomGenerator := Random new
]

{ #category : 'generating' }
MTRandomGroupedMutantSelectionStrategy >> mutationsFor: aMutationTestingAnalysis loggingIn: aLogger [

	| mutations shuffledMutations mutationDict |
	mutations := mutationsGenerationStrategy
		             mutationsFor: aMutationTestingAnalysis
		             loggingIn: aLogger.

	"Invariant: mutationsDict values are never empty.
	If they were to be empty, we remove the entry from the dictionary."
	mutationDict := mutations groupedBy: self groupCondition.
	mutationDict := mutationDict collect: [ :mutationList |
		                (mutationList shuffleBy: randomGenerator)
			                readStream ].

	shuffledMutations := OrderedCollection new.
	1 to: mutations size do: [ :i |
		| key streamValue |
		key := mutationDict keys atRandom: randomGenerator.
		streamValue := mutationDict at: key.
		shuffledMutations add: streamValue next.
		streamValue atEnd ifTrue: [ mutationDict removeKey: key ] ].

	^ shuffledMutations
]

{ #category : 'accessing' }
MTRandomGroupedMutantSelectionStrategy >> randomGenerator [

	^ randomGenerator
]

{ #category : 'accessing' }
MTRandomGroupedMutantSelectionStrategy >> randomGenerator: anObject [

	randomGenerator := anObject
]
