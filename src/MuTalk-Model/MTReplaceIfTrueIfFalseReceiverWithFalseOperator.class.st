Class {
	#name : 'MTReplaceIfTrueIfFalseReceiverWithFalseOperator',
	#superclass : 'MTReplaceIfTrueIfFalseReceiverOperator',
	#category : 'MuTalk-Model-Operators - Conditional boolean operation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Conditional boolean operation'
}

{ #category : 'applying' }
MTReplaceIfTrueIfFalseReceiverWithFalseOperator >> newReceiverExpression [ 
	^'false'
]

{ #category : 'suggestions' }
MTReplaceIfTrueIfFalseReceiverWithFalseOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [
	^aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceIfTrueIfFalseReceiverWithFalseOperator: aMutation.
]
