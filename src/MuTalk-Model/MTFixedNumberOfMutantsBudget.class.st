Class {
	#name : 'MTFixedNumberOfMutantsBudget',
	#superclass : 'MTBudget',
	#category : 'MuTalk-Model-Budgets',
	#package : 'MuTalk-Model',
	#tag : 'Budgets'
}

{ #category : 'validation' }
MTFixedNumberOfMutantsBudget >> exceedsBudgetOn: computedMutations fromTotalMutations: totalMutations [

	^ computedMutations size >= constraint
]
