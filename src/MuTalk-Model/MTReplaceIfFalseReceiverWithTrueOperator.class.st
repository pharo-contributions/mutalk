Class {
	#name : #MTReplaceIfFalseReceiverWithTrueOperator,
	#superclass : #MTReplaceIfFalseReceiverOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #applying }
MTReplaceIfFalseReceiverWithTrueOperator >> newReceiverExpression [
	^'true'
]

{ #category : #suggestions }
MTReplaceIfFalseReceiverWithTrueOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [
	^aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceIfFalseReceiverWithTrueOperator: aMutation.
]
