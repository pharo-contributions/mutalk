Class {
	#name : #ReplaceIfTrueReceiverWithFalseOperator,
	#superclass : #ReplaceIfTrueReceiverOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #applying }
ReplaceIfTrueReceiverWithFalseOperator >> newReceiverExpression [
	^'false'
]

{ #category : #suggestions }
ReplaceIfTrueReceiverWithFalseOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [
	^aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceIfTrueReceiverWithFalseOperator: aMutation.
]
