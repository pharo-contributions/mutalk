Class {
	#name : 'RandomOperatorMutantSelectionStrategy',
	#superclass : 'Object',
	#instVars : [
		'randomMutantSelection'
	],
	#category : 'MuTalk-Model-Mutations generation strategies',
	#package : 'MuTalk-Model',
	#tag : 'Mutations generation strategies'
}

{ #category : 'intialization' }
RandomOperatorMutantSelectionStrategy class >> fixed: aNumber [

	^ self new randomMutantSelection:
		  (FixedRandomMutantSelectionStrategy new numberOfMutants: aNumber)
]

{ #category : 'intialization' }
RandomOperatorMutantSelectionStrategy class >> percent: aPercentage [

	^ self new randomMutantSelection:
		  (PercentRandomMutantSelectionStrategy new percentageOfMutants: aPercentage)
]

{ #category : 'adding' }
RandomOperatorMutantSelectionStrategy >> addMutantIn: newColl from: oldColl using: random and: aNumber [

	randomMutantSelection addMutantIn: newColl from: oldColl using: random and: aNumber
]

{ #category : 'accessing-defaults' }
RandomOperatorMutantSelectionStrategy >> defaultMutationGenerationStrategy [

	^ randomMutantSelection defaultMutationGenerationStrategy
]

{ #category : 'accessing' }
RandomOperatorMutantSelectionStrategy >> highLimitCondition: aSize [

	^ randomMutantSelection highLimitCondition: aSize
]

{ #category : 'initialization' }
RandomOperatorMutantSelectionStrategy >> initialize [

	randomMutantSelection initialize
]

{ #category : 'accessing' }
RandomOperatorMutantSelectionStrategy >> lowLimitCondition [

	^ randomMutantSelection lowLimitCondition
]

{ #category : 'generating' }
RandomOperatorMutantSelectionStrategy >> methodsToMutateFrom: aMutationTestingAnalysis [

	^ randomMutantSelection methodsToMutateFrom: aMutationTestingAnalysis
]

{ #category : 'generating' }
RandomOperatorMutantSelectionStrategy >> mutationsFor: aMutationTestingAnalysis [

	^ randomMutantSelection mutationsFor: aMutationTestingAnalysis
]

{ #category : 'generating' }
RandomOperatorMutantSelectionStrategy >> mutationsFor: aMutationTestingAnalysis loggingIn: aLogger [

	^ randomMutantSelection
		  mutationsFor: aMutationTestingAnalysis
		  loggingIn: aLogger
]

{ #category : 'generating' }
RandomOperatorMutantSelectionStrategy >> mutationsFor: aMethod usingAll: aCollectionOfMutantOperators logginIn: aLogger [

	^ randomMutantSelection
		  mutationsFor: aMethod
		  usingAll: aCollectionOfMutantOperators
		  logginIn: aLogger
]

{ #category : 'accessing' }
RandomOperatorMutantSelectionStrategy >> mutationsGenerationStrategy [

	^ randomMutantSelection mutationsGenerationStrategy
]

{ #category : 'accessing' }
RandomOperatorMutantSelectionStrategy >> mutationsGenerationStrategy: aMutationsGenerationStrategy [

	^ randomMutantSelection mutationsGenerationStrategy:
		  aMutationsGenerationStrategy
]

{ #category : 'logging' }
RandomOperatorMutantSelectionStrategy >> nullLogger [

	^ randomMutantSelection nullLogger
]

{ #category : 'accessing' }
RandomOperatorMutantSelectionStrategy >> randomMutantSelection [

	^ randomMutantSelection
]

{ #category : 'accessing' }
RandomOperatorMutantSelectionStrategy >> randomMutantSelection: anObject [

	randomMutantSelection := anObject
]

{ #category : 'generating' }
RandomOperatorMutantSelectionStrategy >> selectMutantsFrom: aCollection [

	| size newColl random dict operators operator |
	newColl := aCollection copyEmpty.
	random := Random new.

	self lowLimitCondition ifTrue: [ ^ newColl ].
	(self highLimitCondition: aCollection size) ifTrue: [ ^ aCollection ].

	dict := aCollection groupedBy: [ :e | e operator ].
	operators := dict keys.
	1 to: (self totalNumberOfMutants: aCollection size) do: [ :i |
		operator := operators at:
			            (random nextIntegerBetween: 1 and: operators size).

		"if all the mutants generated with a given operator have already been selected, another operator is chosen"
		[ (dict at: operator) allSatisfy: [ :each | newColl includes: each ] ]
			whileTrue: [
				operator := operators at:
					            (random nextIntegerBetween: 1 and: operators size) ].

		size := (dict at: operator) size.
		self
			addMutantIn: newColl
			from: (dict at: operator)
			using: random
			and: size ].
	^ newColl
]

{ #category : 'accessing' }
RandomOperatorMutantSelectionStrategy >> totalNumberOfMutants: aSize [

	^ randomMutantSelection totalNumberOfMutants: aSize
]
