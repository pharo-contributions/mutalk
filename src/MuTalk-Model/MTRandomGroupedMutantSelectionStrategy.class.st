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

{ #category : 'accessing' }
MTRandomGroupedMutantSelectionStrategy >> randomGenerator [

	^ randomGenerator
]

{ #category : 'accessing' }
MTRandomGroupedMutantSelectionStrategy >> randomGenerator: anObject [

	randomGenerator := anObject
]

{ #category : 'generating' }
MTRandomGroupedMutantSelectionStrategy >> shuffleMutants: aMutantCollection [

	| shuffledMutants mutationDict |

	"Invariant: mutationsDict values are never empty.
	If they were to be empty, we remove the entry from the dictionary."
	mutationDict := aMutantCollection groupedBy: self groupCondition.
	mutationDict := mutationDict collect: [ :mutationList |
		                (mutationList shuffleBy: randomGenerator)
			                readStream ].

	shuffledMutants := OrderedCollection new.
	1 to: aMutantCollection size do: [ :i |
		| key streamValue |
		key := mutationDict keys atRandom: randomGenerator.
		streamValue := mutationDict at: key.
		shuffledMutants add: streamValue next.
		streamValue atEnd ifTrue: [ mutationDict removeKey: key ] ].

	^ shuffledMutants
]
