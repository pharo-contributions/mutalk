Class {
	#name : #RandomOperatorMutantSelectionTest,
	#superclass : #TestCase,
	#instVars : [
		'coll'
	],
	#category : #'MuTalk-Tests'
}

{ #category : #running }
RandomOperatorMutantSelectionTest >> setUp [

	| mutants |
	super setUp.

	coll := OrderedCollection new.
	mutants := OrderedCollection new.
	mutants addAll: {
			(MethodMutation
				 for: AuxiliarClassForTestingStrategies >> #method1
				 using: 'Operator1'
				 nodeNumber: 1
				 ofClass: AuxiliarClassForTestingStrategies).
			(MethodMutation
				 for: AuxiliarClassForTestingStrategies >> #method1
				 using: 'Operator2'
				 nodeNumber: 1
				 ofClass: AuxiliarClassForTestingStrategies).
			(MethodMutation
				 for: AuxiliarClassForTestingStrategies >> #method1
				 using: 'Operator3'
				 nodeNumber: 1
				 ofClass: AuxiliarClassForTestingStrategies).
			(MethodMutation
				 for: AuxiliarClassForTestingStrategies >> #method2
				 using: 'Operator1'
				 nodeNumber: 1
				 ofClass: AuxiliarClassForTestingStrategies).
			(MethodMutation
				 for: AuxiliarClassForTestingStrategies >> #method2
				 using: 'Operator2'
				 nodeNumber: 1
				 ofClass: AuxiliarClassForTestingStrategies).
			(MethodMutation
				 for: AuxiliarClassForTestingStrategies >> #method2
				 using: 'Operator3'
				 nodeNumber: 1
				 ofClass: AuxiliarClassForTestingStrategies) }.
	coll addAll: mutants
]

{ #category : #tests }
RandomOperatorMutantSelectionTest >> testFixedSelectMutantsFrom [

	| select newColl |
	select := RandomOperatorMutantSelectionStrategy fixed: 3.
	newColl := select selectMutantsFrom: coll.
	self assert: newColl size equals: 3
]

{ #category : #tests }
RandomOperatorMutantSelectionTest >> testFixedSelectMutantsFrom2 [

	| select newColl |
	select := RandomOperatorMutantSelectionStrategy fixed: 0.
	newColl := select selectMutantsFrom: coll.
	self assert: newColl equals: {  } asOrderedCollection
]

{ #category : #tests }
RandomOperatorMutantSelectionTest >> testFixedSelectMutantsFrom3 [

	| select newColl |
	select := RandomOperatorMutantSelectionStrategy fixed: 6.
	newColl := select selectMutantsFrom: coll.
	self assert: newColl equals: coll
]

{ #category : #tests }
RandomOperatorMutantSelectionTest >> testFixedSelectMutantsFrom4 [

	| select newColl |
	select := RandomOperatorMutantSelectionStrategy fixed: 10.
	newColl := select selectMutantsFrom: coll.
	self assert: newColl equals: coll
]

{ #category : #tests }
RandomOperatorMutantSelectionTest >> testFixedSelectMutantsFromDistinctElements [

	| select newColl |
	select := RandomOperatorMutantSelectionStrategy fixed: 5.
	newColl := select selectMutantsFrom: coll.
	self
		assert: newColl copyWithoutDuplicates asBag
		equals: newColl asBag
]

{ #category : #tests }
RandomOperatorMutantSelectionTest >> testPercentSelectMutantsFrom [

	| select newColl |
	select := RandomOperatorMutantSelectionStrategy percent: 50.
	newColl := select selectMutantsFrom: coll.
	self assert: newColl size equals: 3
]

{ #category : #tests }
RandomOperatorMutantSelectionTest >> testPercentSelectMutantsFrom2 [

	| select newColl |
	select := RandomOperatorMutantSelectionStrategy percent: 0.
	newColl := select selectMutantsFrom: coll.
	self assert: newColl equals: {  } asOrderedCollection
]

{ #category : #tests }
RandomOperatorMutantSelectionTest >> testPercentSelectMutantsFrom3 [

	| select newColl |
	select := RandomOperatorMutantSelectionStrategy percent: 100.
	newColl := select selectMutantsFrom: coll.
	self assert: newColl equals: coll
]

{ #category : #tests }
RandomOperatorMutantSelectionTest >> testPercentSelectMutantsFrom4 [

	self
		should: [ RandomOperatorMutantSelectionStrategy percent: -50 ]
		raise: Error
]

{ #category : #tests }
RandomOperatorMutantSelectionTest >> testPercentSelectMutantsFrom5 [

	self
		should: [ RandomOperatorMutantSelectionStrategy percent: 150 ]
		raise: Error
]

{ #category : #tests }
RandomOperatorMutantSelectionTest >> testPercentSelectMutantsFromDistinctElements [

	| select newColl |
	select := RandomOperatorMutantSelectionStrategy percent: 90.
	newColl := select selectMutantsFrom: coll.
	self
		assert: newColl copyWithoutDuplicates asBag
		equals: newColl asBag
]
