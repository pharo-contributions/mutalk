Class {
	#name : 'MTFixedNumberOfMutantsBudget',
	#superclass : 'MTBudget',
	#category : 'MuTalk-Model',
	#package : 'MuTalk-Model'
}

{ #category : 'validation' }
MTFixedNumberOfMutantsBudget >> exceedsBudgetOn: computedMutations fromTotalMutations: totalMutations [

	^ computedMutations size >= constraint
]
