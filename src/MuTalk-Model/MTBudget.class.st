Class {
	#name : 'MTBudget',
	#superclass : 'Object',
	#instVars : [
		'constraint'
	],
	#category : 'MuTalk-Model',
	#package : 'MuTalk-Model'
}

{ #category : 'instance creation' }
MTBudget class >> for: aConstraint [

	^ self new
		  constraint: aConstraint;
		  yourself
]

{ #category : 'validation' }
MTBudget >> check: partialCollection with: initialCollection [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
MTBudget >> constraint [

	^ constraint
]

{ #category : 'accessing' }
MTBudget >> constraint: aConstraint [

	constraint := aConstraint
]

{ #category : 'accessing' }
MTBudget >> start [
	"Does nothing for most budgets because they don't need specific data at the start of the execution of the mutation testing analysis, but some do (time budget for example).
	In this case, this method should be overriden."

	
]
