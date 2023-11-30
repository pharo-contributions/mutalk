Class {
	#name : #RandomMutantSelectionStrategy,
	#superclass : #Object,
	#instVars : [
		'mutationsGenerationStrategy'
	],
	#category : #'MuTalk-Model-Mutations generation strategies'
}

{ #category : #'instance creation' }
RandomMutantSelectionStrategy class >> using: aMutationsGenerationStrategy [

	^ self new mutationsGenerationStrategy: aMutationsGenerationStrategy
]

{ #category : #adding }
RandomMutantSelectionStrategy >> addMutantIn: newColl from: oldColl using: random and: aNumber [

	| index |
	index := random nextIntegerBetween: 1 and: aNumber.

	"If the selected mutant has already been added, another one is chosen"
	[ newColl includes: (oldColl at: index) ] whileTrue: [
		index := random nextIntegerBetween: 1 and: aNumber ].

	newColl add: (oldColl at: index)
]

{ #category : #'accessing-defaults' }
RandomMutantSelectionStrategy >> defaultMutationGenerationStrategy [

	^ AllMutantSelectionStrategy new
]

{ #category : #accessing }
RandomMutantSelectionStrategy >> highLimitCondition: aSize [

	^ self subclassResponsibility
]

{ #category : #initialization }
RandomMutantSelectionStrategy >> initialize [

	super initialize.
	mutationsGenerationStrategy := self defaultMutationGenerationStrategy
]

{ #category : #accessing }
RandomMutantSelectionStrategy >> lowLimitCondition [

	^ self subclassResponsibility
]

{ #category : #generating }
RandomMutantSelectionStrategy >> methodsToMutateFrom: aMutationTestingAnalysis [

	^ mutationsGenerationStrategy methodsToMutateFrom: aMutationTestingAnalysis
]

{ #category : #generating }
RandomMutantSelectionStrategy >> mutationsFor: aMutationTestingAnalysis [

	^ self
		  mutationsFor: aMutationTestingAnalysis
		  loggingIn: self nullLogger
]

{ #category : #generating }
RandomMutantSelectionStrategy >> mutationsFor: aMutationTestingAnalysis loggingIn: aLogger [

	| mutations |
	mutations := mutationsGenerationStrategy mutationsFor:
		             aMutationTestingAnalysis loggingIn: aLogger.
	^ self selectMutantsFrom: mutations
]

{ #category : #generating }
RandomMutantSelectionStrategy >> mutationsFor: aMethod usingAll: aCollectionOfMutantOperators logginIn: aLogger [

	^ mutationsGenerationStrategy
		  mutationsFor: aMethod
		  usingAll: aCollectionOfMutantOperators
		  logginIn: aLogger
]

{ #category : #accessing }
RandomMutantSelectionStrategy >> mutationsGenerationStrategy [

	^ mutationsGenerationStrategy
]

{ #category : #accessing }
RandomMutantSelectionStrategy >> mutationsGenerationStrategy: aMutationsGenerationStrategy [

	mutationsGenerationStrategy := aMutationsGenerationStrategy
]

{ #category : #logging }
RandomMutantSelectionStrategy >> nullLogger [

	^ mutationsGenerationStrategy nullLogger
]

{ #category : #generating }
RandomMutantSelectionStrategy >> selectMutantsFrom: aCollection [

	| size newColl random |
	size := aCollection size.
	newColl := aCollection copyEmpty.
	random := Random new.

	self lowLimitCondition ifTrue: [ ^ newColl ].
	(self highLimitCondition: aCollection size) ifTrue: [ ^ aCollection ].

	1 to: (self totalNumberOfMutants: aCollection size) do: [ :i |
		self
			addMutantIn: newColl
			from: aCollection
			using: random
			and: size ].
	^ newColl
]

{ #category : #accessing }
RandomMutantSelectionStrategy >> totalNumberOfMutants: aSize [

	^ self subclassResponsibility
]
