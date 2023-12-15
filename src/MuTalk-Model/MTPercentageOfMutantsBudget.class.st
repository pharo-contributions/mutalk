Class {
	#name : 'MTPercentageOfMutantsBudget',
	#superclass : 'MTBudget',
	#category : 'MuTalk-Model',
	#package : 'MuTalk-Model'
}

{ #category : 'validation' }
MTPercentageOfMutantsBudget >> exceedsBudgetOn: computedMutations fromTotalMutations: totalMutations [

	^ computedMutations size
	  >= (constraint / 100 * totalMutations size)
]
