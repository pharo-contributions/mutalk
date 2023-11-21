Class {
	#name : #PercentRandomMutantSelection,
	#superclass : #RandomMutantSelection,
	#instVars : [
		'percentageOfMutants'
	],
	#category : #'MuTalk-Model-Mutations generation strategies'
}

{ #category : #accessing }
PercentRandomMutantSelection >> highLimitCondition: size [

	^ percentageOfMutants = 100
]

{ #category : #accessing }
PercentRandomMutantSelection >> lowLimitCondition [

	^ percentageOfMutants = 0
]

{ #category : #accessing }
PercentRandomMutantSelection >> numberOfMutants: aSize [

	^ percentageOfMutants * aSize / 100
]

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
