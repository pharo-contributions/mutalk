Class {
	#name : #AuxiliarTestClassForMutationTestingBudget,
	#superclass : #TestCase,
	#instVars : [
		'object'
	],
	#category : #'MuTalk-TestResources'
}

{ #category : #running }
AuxiliarTestClassForMutationTestingBudget >> setUp [
	super setUp.

	object := AuxiliarClassForMutationTestingBudget new.
	(Duration seconds: 2) wait
]

{ #category : #tests }
AuxiliarTestClassForMutationTestingBudget >> testDecrement [

	self assert: (object decrement: 2) equals: 1
]

{ #category : #tests }
AuxiliarTestClassForMutationTestingBudget >> testIncrement [

	self assert: (object increment: 1) equals: 2
]
