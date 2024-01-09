Class {
	#name : 'MTPercentageOfMutantsBudget',
	#superclass : 'MTBudget',
	#category : 'MuTalk-Model-Budgets',
	#package : 'MuTalk-Model',
	#tag : 'Budgets'
}

{ #category : 'validation' }
MTPercentageOfMutantsBudget >> exceedsBudgetOn: computedMutations fromTotalMutations: totalMutations [

	^ computedMutations size
	  >= (constraint / 100 * totalMutations size)
]
