Class {
	#name : #MutationTestingPercentRandomMutantsBudget,
	#superclass : #MutationTestingBudget,
	#category : #'MuTalk-Model'
}

{ #category : #validation }
MutationTestingPercentRandomMutantsBudget >> check: partialCollection with: initialCollection [

	^ partialCollection size
	  >= (constraint / 100 * initialCollection size)
]

{ #category : #accessing }
MutationTestingPercentRandomMutantsBudget >> start [

	
]
