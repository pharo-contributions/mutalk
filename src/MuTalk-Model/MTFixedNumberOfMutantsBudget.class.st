Class {
	#name : 'MTFixedNumberOfMutantsBudget',
	#superclass : 'MTBudget',
	#category : 'MuTalk-Model',
	#package : 'MuTalk-Model'
}

{ #category : 'validation' }
MTFixedNumberOfMutantsBudget >> exceedBudgetOn: partialCollection considering: initialCollection [

	^ partialCollection size >= constraint
]
