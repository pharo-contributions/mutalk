Class {
	#name : #MTFixedNumberOfMutantsBudget,
	#superclass : #MTBudget,
	#category : 'MuTalk-Model-Budgets'
}

{ #category : #validation }
MTFixedNumberOfMutantsBudget >> exceedsBudgetOn: computedMutations fromTotalMutations: totalMutations [

	^ computedMutations size >= constraint
]
