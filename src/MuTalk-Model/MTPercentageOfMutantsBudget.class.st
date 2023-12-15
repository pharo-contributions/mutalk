Class {
	#name : 'MTPercentageOfMutantsBudget',
	#superclass : 'MTBudget',
	#category : 'MuTalk-Model',
	#package : 'MuTalk-Model'
}

{ #category : 'validation' }
MTPercentageOfMutantsBudget >> exceedBudgetOn: partialCollection considering: initialCollection [

	^ partialCollection size
	  >= (constraint / 100 * initialCollection size)
]
