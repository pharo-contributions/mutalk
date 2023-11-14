Class {
	#name : #PercentRandomMutantSelection,
	#superclass : #RandomMutantSelection,
	#instVars : [
		'percentageOfMutants'
	],
	#category : #'MuTalk-Model-Mutations generation strategies'
}

{ #category : #accessing }
PercentRandomMutantSelection >> percentageOfMutants [

	^ percentageOfMutants
]

{ #category : #accessing }
PercentRandomMutantSelection >> percentageOfMutants: aPercentage [

	(aPercentage < 0 or: [ aPercentage > 100 ]) ifTrue: [
		Error signal: 'Percantage should be between 0 and 100' ].
	percentageOfMutants := aPercentage
]

{ #category : #accessing }
PercentRandomMutantSelection >> selectMutantsFrom: aCollection [

	| size index newColl random numberOfMutants |
	size := aCollection size.
	newColl := aCollection copyEmpty.
	random := Random new.
	numberOfMutants := size * percentageOfMutants / 100.

	percentageOfMutants = 0 ifTrue: [ ^ newColl ].
	percentageOfMutants = 100 ifTrue: [ ^ aCollection ].

	1 to: numberOfMutants do: [ :i |
		index := random nextIntegerBetween: 1 and: size.
		newColl add: (aCollection at: index) ].
	^ newColl
]