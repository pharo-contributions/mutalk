Class {
	#name : 'MutationTestingTimeBudget',
	#superclass : 'MutationTestingBudget',
	#instVars : [
		'initialTime'
	],
	#category : 'MuTalk-Model',
	#package : 'MuTalk-Model'
}

{ #category : 'instance creation' }
MutationTestingTimeBudget class >> for: aDuration [

	^ self new
		  constraint: aDuration;
		  yourself
]

{ #category : 'validation' }
MutationTestingTimeBudget >> check: aCollection [

	| currentTime |
	currentTime := Time current asMilliSeconds.
	^ currentTime - initialTime >= constraint asMilliSeconds
]

{ #category : 'accessing' }
MutationTestingTimeBudget >> start [

	initialTime := Time current asMilliSeconds
]
