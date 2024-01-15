Class {
	#name : 'MTReplaceAndArgumentWithTrueOperator',
	#superclass : 'MutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'printing' }
MTReplaceAndArgumentWithTrueOperator >> description [
	^'Replace #and: argument with [true]'.
]

{ #category : 'applying' }
MTReplaceAndArgumentWithTrueOperator >> expressionToReplace [ 
	^'``@object and: ``@aBlock'
]

{ #category : 'applying' }
MTReplaceAndArgumentWithTrueOperator >> newExpression [ 
	^'``@object and: [true]'
]

{ #category : 'suggestions' }
MTReplaceAndArgumentWithTrueOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [
	^aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceAndArgumentWithTrueOperator: aMutation.
]
