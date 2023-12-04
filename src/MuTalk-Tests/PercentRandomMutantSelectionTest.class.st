Class {
	#name : #PercentRandomMutantSelectionTest,
	#superclass : #RandomMutantSelectionTest,
	#category : #'MuTalk-Tests'
}

{ #category : #tests }
PercentRandomMutantSelectionTest >> testSelectMutantsFrom [

	| select coll |
	coll := (1 to: 10) asOrderedCollection.
	select := PercentRandomMutantSelectionStrategy new percentageOfMutants: 50.
	self assert: (select selectMutantsFrom: coll) size equals: 5
]

{ #category : #tests }
PercentRandomMutantSelectionTest >> testSelectMutantsFrom2 [

	| select coll |
	coll := (1 to: 10) asOrderedCollection.
	select := PercentRandomMutantSelectionStrategy new percentageOfMutants: 0.
	self
		assert: (select selectMutantsFrom: coll)
		equals: {  } asOrderedCollection
]

{ #category : #tests }
PercentRandomMutantSelectionTest >> testSelectMutantsFrom3 [

	| select coll |
	coll := (1 to: 10) asOrderedCollection.
	select := PercentRandomMutantSelectionStrategy new percentageOfMutants: 100.
	self assert: (select selectMutantsFrom: coll) equals: coll
]

{ #category : #tests }
PercentRandomMutantSelectionTest >> testSelectMutantsFrom4 [

	| select coll |
	coll := (1 to: 10) asOrderedCollection.
	select := PercentRandomMutantSelectionStrategy new.
	self should: [ select percentageOfMutants: -50 ] raise: Error
]

{ #category : #tests }
PercentRandomMutantSelectionTest >> testSelectMutantsFrom5 [

	| select coll |
	coll := (1 to: 10) asOrderedCollection.
	select := PercentRandomMutantSelectionStrategy new.
	self should: [ select percentageOfMutants: 150 ] raise: Error
]

{ #category : #tests }
PercentRandomMutantSelectionTest >> testSelectMutantsFromDistinctElements [

	| select coll newColl |
	coll := (1 to: 10) asOrderedCollection.
	select := PercentRandomMutantSelectionStrategy new percentageOfMutants: 90.
	newColl := select selectMutantsFrom: coll.
	self
		assert: newColl copyWithoutDuplicates asBag
		equals: newColl asBag
]
