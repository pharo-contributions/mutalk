Class {
	#name : #MutationTestingTimeBudget,
	#superclass : #MutationTestingBudget,
	#instVars : [
		'initialTime'
	],
	#category : #'MuTalk-Model'
}

{ #category : #validation }
MutationTestingTimeBudget >> check: aCollection [

	| currentTime |
	currentTime := Time current.
	^ (currentTime subtractTime: initialTime) >= constraint
]

{ #category : #accessing }
MutationTestingTimeBudget >> start [

	initialTime := Time current
]
