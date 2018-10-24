Class {
	#name : #ReplaceAndWithFalseOperator,
	#superclass : #MutantOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #printing }
ReplaceAndWithFalseOperator >> description [
	^'Replace #and: with false'.
]

{ #category : #applying }
ReplaceAndWithFalseOperator >> expressionToReplace [ 
	^'``@object and: ``@aBlock'
]

{ #category : #applying }
ReplaceAndWithFalseOperator >> newExpression [ 
	^'false'
]

{ #category : #suggestions }
ReplaceAndWithFalseOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [
	^aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceAndWithFalseOperator: aMutation.
]
