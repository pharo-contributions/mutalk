Class {
	#name : 'FixedRandomMutantSelectionStrategy',
	#superclass : 'RandomMutantSelectionStrategy',
	#instVars : [
		'numberOfMutants'
	],
	#category : 'MuTalk-Model-Mutations generation strategies',
	#package : 'MuTalk-Model',
	#tag : 'Mutations generation strategies'
}

{ #category : 'accessing' }
FixedRandomMutantSelectionStrategy >> highLimitCondition: aSize [

	^ aSize <= self numberOfMutants
]

{ #category : 'accessing' }
FixedRandomMutantSelectionStrategy >> lowLimitCondition [

	^ self numberOfMutants = 0
]

{ #category : 'accessing' }
FixedRandomMutantSelectionStrategy >> numberOfMutants [

	^ numberOfMutants
]

{ #category : 'accessing' }
FixedRandomMutantSelectionStrategy >> numberOfMutants: aNumber [

	numberOfMutants := aNumber
]

{ #category : 'accessing' }
FixedRandomMutantSelectionStrategy >> totalNumberOfMutants: aSize [

	^ self numberOfMutants
]
