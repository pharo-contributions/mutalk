Class {
	#name : #ReplaceAndReceiverWithTrueOperator,
	#superclass : #ReplaceAndReceiverOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #applying }
ReplaceAndReceiverWithTrueOperator >> newReceiverExpression [ 
	^'true'
]

{ #category : #applying }
ReplaceAndReceiverWithTrueOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [ 
	^ aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceAndReceiverWithTrueMutantOperator: aMutation
]
