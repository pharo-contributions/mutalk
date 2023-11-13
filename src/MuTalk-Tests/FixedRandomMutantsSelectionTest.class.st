Class {
	#name : #FixedRandomMutantsSelectionTest,
	#superclass : #RandomMutantsEvaluationStrategyTest,
	#category : #'MuTalk-Tests'
}

{ #category : #tests }
FixedRandomMutantsSelectionTest >> testSelectMutantsFrom [

	| select coll |
	coll := (1 to: 10) asOrderedCollection.
	select := FixedRandomMutantsSelection new numberOfMutants: 5.
	self assert: (select selectMutantsFrom: coll) size equals: 5
]

{ #category : #tests }
FixedRandomMutantsSelectionTest >> testSelectMutantsFrom2 [

	| select coll |
	coll := (1 to: 10) asOrderedCollection.
	select := FixedRandomMutantsSelection new numberOfMutants: 0.
	self
		assert: (select selectMutantsFrom: coll)
		equals: {  } asOrderedCollection
]

{ #category : #tests }
FixedRandomMutantsSelectionTest >> testSelectMutantsFrom3 [

	| select coll |
	coll := (1 to: 10) asOrderedCollection.
	select := FixedRandomMutantsSelection new numberOfMutants: 10.
	self assert: (select selectMutantsFrom: coll) equals: coll
]

{ #category : #tests }
FixedRandomMutantsSelectionTest >> testSelectMutantsFrom4 [

	| select coll |
	coll := (1 to: 10) asOrderedCollection.
	select := FixedRandomMutantsSelection new numberOfMutants: 20.
	self assert: (select selectMutantsFrom: coll) equals: coll
]
