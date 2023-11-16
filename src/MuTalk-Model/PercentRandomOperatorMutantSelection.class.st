Class {
	#name : #PercentRandomOperatorMutantSelection,
	#superclass : #PercentRandomMutantSelection,
	#category : #'MuTalk-Model-Mutations generation strategies'
}

{ #category : #accessing }
PercentRandomOperatorMutantSelection >> selectMutantsFrom: aCollection [

	| size index newColl random numberOfMutants dict operators operator |
	newColl := aCollection copyEmpty.
	random := Random new.
	numberOfMutants := aCollection size * percentageOfMutants / 100.

	percentageOfMutants = 0 ifTrue: [ ^ newColl ].
	percentageOfMutants = 100 ifTrue: [ ^ aCollection ].
	
	dict := aCollection groupedBy: [ :e | e operator ].
	operators := dict keys.
	1 to: numberOfMutants do: [ :i |
		operator := operators at:
			            (random nextIntegerBetween: 1 and: operators size).
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
