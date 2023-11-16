Class {
	#name : #FixedRandomOperatorMutantSelection,
	#superclass : #FixedRandomMutantSelection,
	#category : #'MuTalk-Model-Mutations generation strategies'
}

{ #category : #accessing }
FixedRandomOperatorMutantSelection >> selectMutantsFrom: aCollection [

	| size index newColl random dict operators operator |
	newColl := aCollection copyEmpty.
	random := Random new.

	numberOfMutants = 0 ifTrue: [ ^ newColl ].
	aCollection size <= numberOfMutants ifTrue: [ ^ aCollection ].

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
