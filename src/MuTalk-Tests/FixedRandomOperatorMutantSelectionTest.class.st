Class {
	#name : #FixedRandomOperatorMutantSelectionTest,
	#superclass : #RandomMutantSelectionTest,
	#instVars : [
		'coll'
	],
	#category : #'MuTalk-Tests'
}

{ #category : #running }
FixedRandomOperatorMutantSelectionTest >> setUp [

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
FixedRandomOperatorMutantSelectionTest >> testSelectMutantsFrom [

	| select newColl |
	select := FixedRandomOperatorMutantSelection new numberOfMutants: 3.
	newColl := select selectMutantsFrom: coll.
	self assert: newColl size equals: 3
]

{ #category : #tests }
FixedRandomOperatorMutantSelectionTest >> testSelectMutantsFrom2 [

	| select newColl |
	select := FixedRandomOperatorMutantSelection new numberOfMutants: 0.
	newColl := select selectMutantsFrom: coll.
	self assert: newColl equals: {  } asOrderedCollection
]

{ #category : #tests }
FixedRandomOperatorMutantSelectionTest >> testSelectMutantsFrom3 [

	| select newColl |
	select := FixedRandomOperatorMutantSelection new numberOfMutants: 6.
	newColl := select selectMutantsFrom: coll.
	self assert: newColl equals: coll
]

{ #category : #tests }
FixedRandomOperatorMutantSelectionTest >> testSelectMutantsFrom4 [

	| select newColl |
	select := FixedRandomOperatorMutantSelection new numberOfMutants: 10.
	newColl := select selectMutantsFrom: coll.
	self assert: newColl equals: coll
]

{ #category : #tests }
FixedRandomOperatorMutantSelectionTest >> testSelectMutantsFromDistinctElements [

	| select newColl |
	select := FixedRandomOperatorMutantSelection new numberOfMutants: 5.
	newColl := select selectMutantsFrom: coll.
	self
		assert: newColl copyWithoutDuplicates asBag
		equals: newColl asBag
]
