Class {
	#name : 'MTReplaceAndReceiverWithTrueOperator',
	#superclass : 'MTReplaceAndReceiverOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'applying' }
MTReplaceAndReceiverWithTrueOperator >> newReceiverExpression [ 
	^'true'
]

{ #category : 'applying' }
MTReplaceAndReceiverWithTrueOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [ 
	^ aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceAndReceiverWithTrueMutantOperator: aMutation
]
