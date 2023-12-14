Class {
	#name : 'MTPercentageOfMutantsBudget',
	#superclass : 'MTBudget',
	#category : 'MuTalk-Model',
	#package : 'MuTalk-Model'
}

{ #category : 'validation' }
MTPercentageOfMutantsBudget >> check: partialCollection with: initialCollection [

	^ partialCollection size
	  >= (constraint / 100 * initialCollection size)
]
