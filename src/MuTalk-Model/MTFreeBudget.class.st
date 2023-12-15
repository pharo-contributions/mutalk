Class {
	#name : 'MTFreeBudget',
	#superclass : 'MTBudget',
	#category : 'MuTalk-Model',
	#package : 'MuTalk-Model'
}

{ #category : 'validation' }
MTFreeBudget >> exceedBudgetOn: partialCollection considering: initialCollection [
	"Since this budget have no constraint, the budget is never exceeded"

	^ false
]
