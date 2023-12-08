Class {
	#name : #MutationTestingFixedRandomMutantsBudget,
	#superclass : #MutationTestingBudget,
	#category : #'MuTalk-Model'
}

{ #category : #validation }
MutationTestingFixedRandomMutantsBudget >> check: partialCollection with: initialCollection [

	^ partialCollection size >= constraint
]

{ #category : #accessing }
MutationTestingFixedRandomMutantsBudget >> start [

	
]
