Class {
	#name : 'ReplaceIfTrueIfFalseReceiverWithTrueOperator',
	#superclass : 'ReplaceIfTrueIfFalseReceiverOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'applying' }
ReplaceIfTrueIfFalseReceiverWithTrueOperator >> newReceiverExpression [ 
	^'true'
]

{ #category : 'suggestions' }
ReplaceIfTrueIfFalseReceiverWithTrueOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [
	^aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceIfTrueIfFalseReceiverWithTrueOperator: aMutation.
]
