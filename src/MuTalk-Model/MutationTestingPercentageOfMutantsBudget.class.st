Class {
	#name : 'MutationTestingPercentageOfMutantsBudget',
	#superclass : 'MutationTestingBudget',
	#category : 'MuTalk-Model',
	#package : 'MuTalk-Model'
}

{ #category : 'validation' }
MutationTestingPercentageOfMutantsBudget >> check: partialCollection with: initialCollection [

	^ partialCollection size
	  >= (constraint / 100 * initialCollection size)
]

{ #category : 'accessing' }
MutationTestingPercentageOfMutantsBudget >> start [

	
]
