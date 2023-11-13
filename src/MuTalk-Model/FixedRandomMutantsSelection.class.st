Class {
	#name : #FixedRandomMutantsSelection,
	#superclass : #RandomMutantsEvaluationStrategy,
	#instVars : [
		'numberOfMutants'
	],
	#category : #'MuTalk-Model-Mutations generation strategies'
}

{ #category : #accessing }
FixedRandomMutantsSelection >> numberOfMutants [

	^ numberOfMutants
]

{ #category : #accessing }
FixedRandomMutantsSelection >> numberOfMutants: aNumber [

	numberOfMutants := aNumber
]

{ #category : #accessing }
FixedRandomMutantsSelection >> selectMutantsFrom: aCollection [

	| size index newColl random |
	size := aCollection size.
	newColl := aCollection copyEmpty.
	random := Random new.

	numberOfMutants = 0 ifTrue: [ ^ newColl ].
	aCollection size <= numberOfMutants ifTrue: [ ^ aCollection ].

	1 to: numberOfMutants do: [ :i |
		index := random nextIntegerBetween: 1 and: size.
		newColl add: (aCollection at: index) ].
	^ newColl
]
