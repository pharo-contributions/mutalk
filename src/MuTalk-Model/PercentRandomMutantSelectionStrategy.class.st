Class {
	#name : 'PercentRandomMutantSelectionStrategy',
	#superclass : 'RandomMutantSelectionStrategy',
	#instVars : [
		'percentageOfMutants'
	],
	#category : 'MuTalk-Model-Mutations generation strategies',
	#package : 'MuTalk-Model',
	#tag : 'Mutations generation strategies'
}

{ #category : 'accessing' }
PercentRandomMutantSelectionStrategy >> highLimitCondition: size [

	^ percentageOfMutants = 100
]

{ #category : 'accessing' }
PercentRandomMutantSelectionStrategy >> lowLimitCondition [

	^ percentageOfMutants = 0
]

{ #category : 'accessing' }
PercentRandomMutantSelectionStrategy >> percentageOfMutants [

	^ percentageOfMutants
]

{ #category : 'accessing' }
PercentRandomMutantSelectionStrategy >> percentageOfMutants: aPercentage [

	(aPercentage < 0 or: [ aPercentage > 100 ]) ifTrue: [
		Error signal: 'Percantage should be between 0 and 100' ].
	percentageOfMutants := aPercentage
]

{ #category : 'accessing' }
PercentRandomMutantSelectionStrategy >> totalNumberOfMutants: aSize [

	^ percentageOfMutants * aSize / 100
]
