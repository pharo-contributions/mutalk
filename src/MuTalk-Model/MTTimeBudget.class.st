Class {
	#name : 'MTTimeBudget',
	#superclass : 'MTBudget',
	#instVars : [
		'initialTime'
	],
	#category : 'MuTalk-Model',
	#package : 'MuTalk-Model'
}

{ #category : 'validation' }
MTTimeBudget >> check: partialCollection with: initialCollection [

	| currentTime |
	currentTime := Time current asMilliSeconds.
	^ currentTime - initialTime >= constraint asMilliSeconds
]

{ #category : 'accessing' }
MTTimeBudget >> start [

	initialTime := Time current asMilliSeconds
]
