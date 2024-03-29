Class {
	#name : 'MTReplaceIfTrueIfFalseReceiverWithTrueOperator',
	#superclass : 'MTReplaceIfTrueIfFalseReceiverOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'applying' }
MTReplaceIfTrueIfFalseReceiverWithTrueOperator >> newReceiverExpression [ 
	^'true'
]

{ #category : 'suggestions' }
MTReplaceIfTrueIfFalseReceiverWithTrueOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [
	^aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceIfTrueIfFalseReceiverWithTrueOperator: aMutation.
]
