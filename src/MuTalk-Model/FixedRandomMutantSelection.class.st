Class {
	#name : #FixedRandomMutantSelection,
	#superclass : #RandomMutantSelection,
	#instVars : [
		'numberOfMutants'
	],
	#category : #'MuTalk-Model-Mutations generation strategies'
}

{ #category : #accessing }
FixedRandomMutantSelection >> highLimitCondition: aSize [

	^ aSize <= self numberOfMutants
]

{ #category : #accessing }
FixedRandomMutantSelection >> lowLimitCondition [

	^ self numberOfMutants = 0
]

{ #category : #accessing }
FixedRandomMutantSelection >> numberOfMutants [

	^ numberOfMutants
]

{ #category : #accessing }
FixedRandomMutantSelection >> numberOfMutants: aSize [

	^ numberOfMutants
]
