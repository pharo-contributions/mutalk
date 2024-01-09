Class {
	#name : 'MTTimeBudget',
	#superclass : 'MTBudget',
	#instVars : [
		'initialTime'
	],
	#category : 'MuTalk-Model-Budgets',
	#package : 'MuTalk-Model',
	#tag : 'Budgets'
}

{ #category : 'validation' }
MTTimeBudget >> exceedsBudgetOn: computedMutations fromTotalMutations: totalMutations [

	| currentTime |
	currentTime := Time current asMilliSeconds.
	^ currentTime - initialTime >= constraint asMilliSeconds
]

{ #category : 'accessing' }
MTTimeBudget >> start [

	initialTime := Time current asMilliSeconds
]
