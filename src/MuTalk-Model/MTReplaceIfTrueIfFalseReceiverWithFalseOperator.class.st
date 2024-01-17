Class {
	#name : 'MTReplaceIfTrueIfFalseReceiverWithFalseOperator',
	#superclass : 'MTReplaceIfTrueIfFalseReceiverOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'applying' }
MTReplaceIfTrueIfFalseReceiverWithFalseOperator >> newReceiverExpression [ 
	^'false'
]

{ #category : 'suggestions' }
MTReplaceIfTrueIfFalseReceiverWithFalseOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [
	^aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceIfTrueIfFalseReceiverWithFalseOperator: aMutation.
]
