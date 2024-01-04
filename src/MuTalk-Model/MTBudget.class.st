Class {
	#name : 'MTBudget',
	#superclass : 'Object',
	#instVars : [
		'constraint'
	],
	#category : 'MuTalk-Model-Budgets',
	#package : 'MuTalk-Model',
	#tag : 'Budgets'
}

{ #category : 'instance creation' }
MTBudget class >> for: aConstraint [

	^ self new
		  constraint: aConstraint;
		  yourself
]

{ #category : 'accessing' }
MTBudget >> constraint [

	^ constraint
]

{ #category : 'accessing' }
MTBudget >> constraint: aConstraint [

	constraint := aConstraint
]

{ #category : 'validation' }
MTBudget >> exceedsBudgetOn: partialCollection fromTotalMutations: initialCollection [
	"Returns true if partialCollection exceed the budget (the time is over, there is enough mutants, etc). Some budgets need data on initialCollection (e.g. percentage budget needs the size)"

	^ self subclassResponsibility
]

{ #category : 'accessing' }
MTBudget >> start [
	"Does nothing for most budgets because they don't need specific data at the start of the execution of the mutation testing analysis, but some do (time budget for example).
	In this case, this method should be overriden."

	
]
