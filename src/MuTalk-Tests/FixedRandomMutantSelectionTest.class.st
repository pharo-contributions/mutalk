Class {
	#name : #FixedRandomMutantSelectionTest,
	#superclass : #RandomMutantSelectionTest,
	#category : #'MuTalk-Tests'
}

{ #category : #tests }
FixedRandomMutantSelectionTest >> testSelectMutantsFrom [

	| select coll |
	coll := (1 to: 10) asOrderedCollection.
	select := FixedRandomMutantSelectionStrategy new numberOfMutants: 5.
	self assert: (select selectMutantsFrom: coll) size equals: 5
]

{ #category : #tests }
FixedRandomMutantSelectionTest >> testSelectMutantsFrom2 [

	| select coll |
	coll := (1 to: 10) asOrderedCollection.
	select := FixedRandomMutantSelectionStrategy new numberOfMutants: 0.
	self
		assert: (select selectMutantsFrom: coll)
		equals: {  } asOrderedCollection
]

{ #category : #tests }
FixedRandomMutantSelectionTest >> testSelectMutantsFrom3 [

	| select coll |
	coll := (1 to: 10) asOrderedCollection.
	select := FixedRandomMutantSelectionStrategy new numberOfMutants: 10.
	self assert: (select selectMutantsFrom: coll) equals: coll
]

{ #category : #tests }
FixedRandomMutantSelectionTest >> testSelectMutantsFrom4 [

	| select coll |
	coll := (1 to: 10) asOrderedCollection.
	select := FixedRandomMutantSelectionStrategy new numberOfMutants: 20.
	self assert: (select selectMutantsFrom: coll) equals: coll
]

{ #category : #tests }
FixedRandomMutantSelectionTest >> testSelectMutantsFromDistinctElements [

	| select coll newColl |
	coll := (1 to: 10) asOrderedCollection.
	select := FixedRandomMutantSelectionStrategy new numberOfMutants: 9.
	newColl := select selectMutantsFrom: coll.
	self
		assert: newColl copyWithoutDuplicates asBag
		equals: newColl asBag
]
