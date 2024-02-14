Class {
	#name : 'MTReplaceOrWithTrueOperator',
	#superclass : 'MTParseRewriterMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'printing' }
MTReplaceOrWithTrueOperator >> description [
	^'Replace #or: with true'.
]

{ #category : 'applying' }
MTReplaceOrWithTrueOperator >> expressionToReplace [ 
	^'``@object or: ``@aBlock'
]

{ #category : 'applying' }
MTReplaceOrWithTrueOperator >> newExpression [ 
	^'true'
]

{ #category : 'suggestions' }
MTReplaceOrWithTrueOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [
	^aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceOrWithTrueOperator: aMutation.
]
