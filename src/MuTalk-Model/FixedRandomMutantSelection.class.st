Class {
	#name : #FixedRandomMutantSelection,
	#superclass : #RandomMutantSelection,
	#instVars : [
		'numberOfMutants'
	],
	#category : #'MuTalk-Model-Mutations generation strategies'
}

{ #category : #accessing }
FixedRandomMutantSelection >> numberOfMutants [

	^ numberOfMutants
]

{ #category : #accessing }
FixedRandomMutantSelection >> numberOfMutants: aNumber [

	numberOfMutants := aNumber
]

{ #category : #accessing }
FixedRandomMutantSelection >> selectMutantsFrom: aCollection [

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
