Class {
	#name : 'MTReplaceIfFalseReceiverWithFalseOperator',
	#superclass : 'MTReplaceIfFalseReceiverOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'applying' }
MTReplaceIfFalseReceiverWithFalseOperator >> newReceiverExpression [
	^'false'
]

{ #category : 'suggestions' }
MTReplaceIfFalseReceiverWithFalseOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [
	^aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceIfFalseReceiverWithFalseOperator: aMutation.
]
