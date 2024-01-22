Class {
	#name : 'MTReplaceAndWithFalseOperator',
	#superclass : 'MTMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
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
