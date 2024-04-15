Class {
	#name : 'MTReplaceAndArgumentWithTrueOperator',
	#superclass : 'MTParseRewriterMutantOperator',
	#category : 'MuTalk-Model-Operators - Logical boolean operation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Logical boolean operation'
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
