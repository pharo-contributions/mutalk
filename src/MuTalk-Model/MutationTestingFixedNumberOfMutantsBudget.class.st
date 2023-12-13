Class {
	#name : 'MutationTestingFixedNumberOfMutantsBudget',
	#superclass : 'MutationTestingBudget',
	#category : 'MuTalk-Model',
	#package : 'MuTalk-Model'
}

{ #category : 'validation' }
MutationTestingFixedNumberOfMutantsBudget >> check: partialCollection with: initialCollection [

	^ partialCollection size >= constraint
]

{ #category : 'accessing' }
MutationTestingFixedNumberOfMutantsBudget >> start [

	
]
