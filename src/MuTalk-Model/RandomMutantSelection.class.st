Class {
	#name : #RandomMutantSelection,
	#superclass : #Object,
	#instVars : [
		'mutationsGenerationStrategy'
	],
	#category : #'MuTalk-Model-Mutations generation strategies'
}

{ #category : #'instance creation' }
RandomMutantSelection class >> using: aMutationsGenerationStrategy [

	^ self new mutationsGenerationStrategy: aMutationsGenerationStrategy
]

{ #category : #adding }
RandomMutantSelection >> addMutantIn: newColl from: oldColl using: random and: aNumber [

	| index |
	index := random nextIntegerBetween: 1 and: aNumber.

	"If the selected mutant has already been added, another one is chosen"
	[ newColl includes: (oldColl at: index) ] whileTrue: [
		index := random nextIntegerBetween: 1 and: aNumber ].

	newColl add: (oldColl at: index)
]

{ #category : #'accessing-defaults' }
RandomMutantSelection >> defaultMutationGenerationStrategy [

	^ AllMutationsGenerationStrategy new
]

{ #category : #accessing }
RandomMutantSelection >> highLimitCondition: aSize [

	^ self subclassResponsibility
]

{ #category : #initialization }
RandomMutantSelection >> initialize [

	super initialize.
	mutationsGenerationStrategy := self defaultMutationGenerationStrategy
]

{ #category : #accessing }
RandomMutantSelection >> lowLimitCondition [

	^ self subclassResponsibility
]

{ #category : #generating }
RandomMutantSelection >> methodsToMutateFrom: aMutationTestingAnalysis [

	^ mutationsGenerationStrategy methodsToMutateFrom: aMutationTestingAnalysis
]

{ #category : #generating }
RandomMutantSelection >> mutationsFor: aMutationTestingAnalysis [

	^ self
		  mutationsFor: aMutationTestingAnalysis
		  loggingIn: self nullLogger
]

{ #category : #generating }
RandomMutantSelection >> mutationsFor: aMutationTestingAnalysis loggingIn: aLogger [

	| mutations |
	mutations := mutationsGenerationStrategy mutationsFor:
		             aMutationTestingAnalysis loggingIn: aLogger.
	^ self selectMutantsFrom: mutations
]

{ #category : #generating }
RandomMutantSelection >> mutationsFor: aMethod usingAll: aCollectionOfMutantOperators logginIn: aLogger [

	^ mutationsGenerationStrategy
		  mutationsFor: aMethod
		  usingAll: aCollectionOfMutantOperators
		  logginIn: aLogger
]

{ #category : #accessing }
RandomMutantSelection >> mutationsGenerationStrategy [

	^ mutationsGenerationStrategy
]

{ #category : #accessing }
RandomMutantSelection >> mutationsGenerationStrategy: aMutationsGenerationStrategy [

	mutationsGenerationStrategy := aMutationsGenerationStrategy
]

{ #category : #logging }
RandomMutantSelection >> nullLogger [

	^ mutationsGenerationStrategy nullLogger
]

{ #category : #generating }
RandomMutantSelection >> selectMutantsFrom: aCollection [

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
RandomMutantSelection >> totalNumberOfMutants: aSize [

	^ self subclassResponsibility
]
