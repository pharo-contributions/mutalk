Class {
	#name : 'ReplaceIfTrueReceiverWithTrueOperator',
	#superclass : 'ReplaceIfTrueReceiverOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'applying' }
ReplaceIfTrueReceiverWithTrueOperator >> newReceiverExpression [
	^'true'
]

{ #category : 'suggestions' }
ReplaceIfTrueReceiverWithTrueOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [
	^aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceIfTrueReceiverWithTrueOperator: aMutation.
]
