Class {
	#name : #AuxiliarClassForMutationTestingBudget,
	#superclass : #Object,
	#category : #'MuTalk-TestResources'
}

{ #category : #arithmetic }
AuxiliarClassForMutationTestingBudget >> decrement: aNumber [

	^ aNumber - 1
]

{ #category : #arithmetic }
AuxiliarClassForMutationTestingBudget >> increment: aNumber [

	^ aNumber + 1
]
