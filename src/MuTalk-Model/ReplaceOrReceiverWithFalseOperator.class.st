Class {
	#name : #ReplaceOrReceiverWithFalseOperator,
	#superclass : #ReplaceOrReceiverOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #applying }
ReplaceOrReceiverWithFalseOperator >> newReceiverExpression [ 
	^'false'
]

{ #category : #applying }
ReplaceOrReceiverWithFalseOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [
	^aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceOrReceiverWithFalseOperator: aMutation.
]
