Class {
	#name : #PercentRandomOperatorMutantSelectionTest,
	#superclass : #RandomMutantSelectionTest,
	#instVars : [
		'coll'
	],
	#category : #'MuTalk-Tests'
}

{ #category : #running }
PercentRandomOperatorMutantSelectionTest >> setUp [

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
PercentRandomOperatorMutantSelectionTest >> testSelectMutantsFrom [

	| select newColl |
	select := PercentRandomOperatorMutantSelection new
		          percentageOfMutants: 50.
	newColl := select selectMutantsFrom: coll.
	self assert: newColl size equals: 3
]

{ #category : #tests }
PercentRandomOperatorMutantSelectionTest >> testSelectMutantsFrom2 [

	| select newColl |
	select := PercentRandomOperatorMutantSelection new
		          percentageOfMutants: 0.
	newColl := select selectMutantsFrom: coll.
	self assert: newColl equals: {  } asOrderedCollection
]

{ #category : #tests }
PercentRandomOperatorMutantSelectionTest >> testSelectMutantsFrom3 [

	| select newColl |
	select := PercentRandomOperatorMutantSelection new
		          percentageOfMutants: 100.
	newColl := select selectMutantsFrom: coll.
	self assert: newColl equals: coll
]

{ #category : #tests }
PercentRandomOperatorMutantSelectionTest >> testSelectMutantsFrom4 [

	| select |
	select := PercentRandomOperatorMutantSelection new.
	self should: [ select percentageOfMutants: -50 ] raise: Error
]

{ #category : #tests }
PercentRandomOperatorMutantSelectionTest >> testSelectMutantsFrom5 [

	| select |
	select := PercentRandomOperatorMutantSelection new.
	self should: [ select percentageOfMutants: 150 ] raise: Error
]

{ #category : #tests }
PercentRandomOperatorMutantSelectionTest >> testSelectMutantsFromDistinctElements [

	| select newColl |
	select := PercentRandomOperatorMutantSelection new
		          percentageOfMutants: 90.
	newColl := select selectMutantsFrom: coll.
	self
		assert: newColl copyWithoutDuplicates asBag
		equals: newColl asBag
]
