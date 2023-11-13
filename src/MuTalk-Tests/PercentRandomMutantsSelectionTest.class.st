Class {
	#name : #PercentRandomMutantsSelectionTest,
	#superclass : #RandomMutantsEvaluationStrategyTest,
	#category : #'MuTalk-Tests'
}

{ #category : #tests }
PercentRandomMutantsSelectionTest >> testSelectMutantsFrom [

	| select coll |
	coll := (1 to: 10) asOrderedCollection.
	select := PercentRandomMutantsSelection new percentageOfMutants: 50.
	self assert: (select selectMutantsFrom: coll) size equals: 5
]

{ #category : #tests }
PercentRandomMutantsSelectionTest >> testSelectMutantsFrom2 [

	| select coll |
	coll := (1 to: 10) asOrderedCollection.
	select := PercentRandomMutantsSelection new percentageOfMutants: 0.
	self
		assert: (select selectMutantsFrom: coll)
		equals: {  } asOrderedCollection
]

{ #category : #tests }
PercentRandomMutantsSelectionTest >> testSelectMutantsFrom3 [

	| select coll |
	coll := (1 to: 10) asOrderedCollection.
	select := PercentRandomMutantsSelection new percentageOfMutants: 100.
	self assert: (select selectMutantsFrom: coll) equals: coll
]

{ #category : #tests }
PercentRandomMutantsSelectionTest >> testSelectMutantsFrom4 [

	| select coll |
	coll := (1 to: 10) asOrderedCollection.
	select := PercentRandomMutantsSelection new.
	self should: [ select percentageOfMutants: -50 ] raise: Error
]

{ #category : #tests }
PercentRandomMutantsSelectionTest >> testSelectMutantsFrom5 [

	| select coll |
	coll := (1 to: 10) asOrderedCollection.
	select := PercentRandomMutantsSelection new.
	self should: [ select percentageOfMutants: 150 ] raise: Error
]
