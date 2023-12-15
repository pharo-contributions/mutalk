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
MTTimeBudget >> exceedBudgetOn: partialCollection considering: initialCollection [

	| currentTime |
	currentTime := Time current asMilliSeconds.
	^ currentTime - initialTime >= constraint asMilliSeconds
]

{ #category : 'accessing' }
MTTimeBudget >> start [

	initialTime := Time current asMilliSeconds
]
