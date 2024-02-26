Class {
	#name : #MTReplaceOrReceiverWithFalseOperator,
	#superclass : #MTReplaceOrReceiverOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #applying }
MTReplaceOrReceiverWithFalseOperator >> newReceiverExpression [ 
	^'false'
]

{ #category : #applying }
MTReplaceOrReceiverWithFalseOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [
	^aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceOrReceiverWithFalseOperator: aMutation.
]
