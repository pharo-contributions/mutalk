Class {
	#name : 'MTReplaceIfTrueReceiverWithFalseOperator',
	#superclass : 'MTReplaceIfTrueReceiverOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'applying' }
MTReplaceIfTrueReceiverWithFalseOperator >> newReceiverExpression [
	^'false'
]

{ #category : 'suggestions' }
MTReplaceIfTrueReceiverWithFalseOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [
	^aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceIfTrueReceiverWithFalseOperator: aMutation.
]
