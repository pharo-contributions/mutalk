Class {
	#name : #RandomOperatorMutantSelection,
	#superclass : #Object,
	#instVars : [
		'randomMutantSelection'
	],
	#category : #'MuTalk-Model-Mutations generation strategies'
}

{ #category : #intialization }
RandomOperatorMutantSelection class >> fixed: aNumber [

	^ self new randomMutantSelection:
		  (FixedRandomMutantSelection new numberOfMutants: aNumber)
]

{ #category : #intialization }
RandomOperatorMutantSelection class >> percent: aPercentage [

	^ self new randomMutantSelection:
		  (PercentRandomMutantSelection new percentageOfMutants: aPercentage)
]

{ #category : #'accessing-defaults' }
RandomOperatorMutantSelection >> defaultMutationGenerationStrategy [

	^ randomMutantSelection defaultMutationGenerationStrategy
]

{ #category : #accessing }
RandomOperatorMutantSelection >> highLimitCondition: aSize [

	^ randomMutantSelection highLimitCondition: aSize
]

{ #category : #initialization }
RandomOperatorMutantSelection >> initialize [

	randomMutantSelection initialize
]

{ #category : #accessing }
RandomOperatorMutantSelection >> lowLimitCondition [

	^ randomMutantSelection lowLimitCondition
]

{ #category : #generating }
RandomOperatorMutantSelection >> methodsToMutateFrom: aMutationTestingAnalysis [

	^ randomMutantSelection methodsToMutateFrom: aMutationTestingAnalysis
]

{ #category : #generating }
RandomOperatorMutantSelection >> mutationsFor: aMutationTestingAnalysis [

	^ randomMutantSelection mutationsFor: aMutationTestingAnalysis
]

{ #category : #generating }
RandomOperatorMutantSelection >> mutationsFor: aMutationTestingAnalysis loggingIn: aLogger [

	^ randomMutantSelection
		  mutationsFor: aMutationTestingAnalysis
		  loggingIn: aLogger
]

{ #category : #generating }
RandomOperatorMutantSelection >> mutationsFor: aMethod usingAll: aCollectionOfMutantOperators logginIn: aLogger [

	^ randomMutantSelection
		  mutationsFor: aMethod
		  usingAll: aCollectionOfMutantOperators
		  logginIn: aLogger
]

{ #category : #accessing }
RandomOperatorMutantSelection >> mutationsGenerationStrategy [

	^ randomMutantSelection mutationGenerationStrategy
]

{ #category : #accessing }
RandomOperatorMutantSelection >> mutationsGenerationStrategy: aMutationsGenerationStrategy [

	^ randomMutantSelection mutationsGenerationStrategy:
		  aMutationsGenerationStrategy
]

{ #category : #logging }
RandomOperatorMutantSelection >> nullLogger [

	^ randomMutantSelection nullLogger
]

{ #category : #accessing }
RandomOperatorMutantSelection >> numberOfMutants: aSize [

	^ randomMutantSelection numberOfMutants: aSize
]

{ #category : #accessing }
RandomOperatorMutantSelection >> randomMutantSelection [

	^ randomMutantSelection
]

{ #category : #accessing }
RandomOperatorMutantSelection >> randomMutantSelection: anObject [

	randomMutantSelection := anObject
]

{ #category : #generating }
RandomOperatorMutantSelection >> selectMutantsFrom: aCollection [

	| size index newColl random dict operators operator |
	newColl := aCollection copyEmpty.
	random := Random new.

	self lowLimitCondition ifTrue: [ ^ newColl ].
	(self highLimitCondition: aCollection size) ifTrue: [ ^ aCollection ].

	dict := aCollection groupedBy: [ :e | e operator ].
	operators := dict keys.
	1 to: (self numberOfMutants: aCollection size) do: [ :i |
		operator := operators at:
			            (random nextIntegerBetween: 1 and: operators size).

		"if all the mutants generated with a given operator have already been selected, another operator is chosen"
		[ (dict at: operator) allSatisfy: [ :each | newColl includes: each ] ]
			whileTrue: [
				operator := operators at:
					            (random nextIntegerBetween: 1 and: operators size) ].

		size := (dict at: operator) size.
		index := random nextIntegerBetween: 1 and: size.
		[ newColl includes: ((dict at: operator) at: index) ] whileTrue: [
			index := random nextIntegerBetween: 1 and: size ].
		newColl add: ((dict at: operator) at: index) ].
	^ newColl
]
