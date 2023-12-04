Class {
	#name : #MutationTestingBudget,
	#superclass : #Object,
	#instVars : [
		'constraint'
	],
	#category : #'MuTalk-Model'
}

{ #category : #validation }
MutationTestingBudget >> check: aCollection [

	^ self subclassResponsibility
]

{ #category : #accessing }
MutationTestingBudget >> constraint [

	^ constraint
]

{ #category : #accessing }
MutationTestingBudget >> constraint: aConstraint [

	constraint := aConstraint
]

{ #category : #accessing }
MutationTestingBudget >> start [

	^ self subclassResponsibility
]
