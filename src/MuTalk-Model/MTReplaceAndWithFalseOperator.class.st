Class {
	#name : 'MTReplaceAndWithFalseOperator',
	#superclass : 'MTParseRewriterMutantOperator',
	#category : 'MuTalk-Model-Operators - Logical boolean operation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Logical boolean operation'
}

{ #category : 'printing' }
MTReplaceAndWithFalseOperator >> description [
	^'Replace #and: with false'.
]

{ #category : 'applying' }
MTReplaceAndWithFalseOperator >> expressionToReplace [ 
	^'``@object and: ``@aBlock'
]

{ #category : 'applying' }
MTReplaceAndWithFalseOperator >> newExpression [ 
	^'false'
]

{ #category : 'suggestions' }
MTReplaceAndWithFalseOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [
	^aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceAndWithFalseOperator: aMutation.
]
