Class {
	#name : 'MTFreeBudget',
	#superclass : 'MTBudget',
	#category : 'MuTalk-Model',
	#package : 'MuTalk-Model'
}

{ #category : 'validation' }
MTFreeBudget >> exceedsBudgetOn: computedMutations fromTotalMutations: totalMutations [
	"Since this budget have no constraint, the budget is never exceeded"

	^ false
]
