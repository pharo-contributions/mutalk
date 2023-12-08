Class {
	#name : 'ReplaceOrWithTrueOperator',
	#superclass : 'MutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'printing' }
ReplaceOrWithTrueOperator >> description [
	^'Replace #or: with true'.
]

{ #category : 'applying' }
ReplaceOrWithTrueOperator >> expressionToReplace [ 
	^'``@object or: ``@aBlock'
]

{ #category : 'applying' }
ReplaceOrWithTrueOperator >> newExpression [ 
	^'true'
]

{ #category : 'suggestions' }
ReplaceOrWithTrueOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [
	^aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceOrWithTrueOperator: aMutation.
]
