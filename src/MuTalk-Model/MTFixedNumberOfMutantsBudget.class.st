Class {
	#name : 'MTFixedNumberOfMutantsBudget',
	#superclass : 'MTBudget',
	#category : 'MuTalk-Model',
	#package : 'MuTalk-Model'
}

{ #category : 'validation' }
MTFixedNumberOfMutantsBudget >> check: partialCollection with: initialCollection [

	^ partialCollection size >= constraint
]
