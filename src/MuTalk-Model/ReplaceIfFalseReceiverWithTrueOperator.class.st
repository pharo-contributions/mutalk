Class {
	#name : #ReplaceIfFalseReceiverWithTrueOperator,
	#superclass : #ReplaceIfFalseReceiverOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #applying }
ReplaceIfFalseReceiverWithTrueOperator >> newReceiverExpression [
	^'true'
]

{ #category : #suggestions }
ReplaceIfFalseReceiverWithTrueOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [
	^aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceIfFalseReceiverWithTrueOperator: aMutation.
]
