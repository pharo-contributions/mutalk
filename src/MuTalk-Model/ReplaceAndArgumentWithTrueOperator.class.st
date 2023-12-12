Class {
	#name : 'ReplaceAndArgumentWithTrueOperator',
	#superclass : 'MutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'printing' }
ReplaceAndArgumentWithTrueOperator >> description [
	^'Replace #and: argument with [true]'.
]

{ #category : 'applying' }
ReplaceAndArgumentWithTrueOperator >> expressionToReplace [ 
	^'``@object and: ``@aBlock'
]

{ #category : 'applying' }
ReplaceAndArgumentWithTrueOperator >> newExpression [ 
	^'``@object and: [true]'
]

{ #category : 'suggestions' }
ReplaceAndArgumentWithTrueOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [
	^aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceAndArgumentWithTrueOperator: aMutation.
]
