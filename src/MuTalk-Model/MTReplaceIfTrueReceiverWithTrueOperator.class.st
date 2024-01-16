Class {
	#name : 'MTReplaceIfTrueReceiverWithTrueOperator',
	#superclass : 'MTReplaceIfTrueReceiverOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'applying' }
MTReplaceIfTrueReceiverWithTrueOperator >> newReceiverExpression [
	^'true'
]

{ #category : 'suggestions' }
MTReplaceIfTrueReceiverWithTrueOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [
	^aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceIfTrueReceiverWithTrueOperator: aMutation.
]
