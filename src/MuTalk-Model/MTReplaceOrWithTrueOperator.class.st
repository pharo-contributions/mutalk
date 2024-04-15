Class {
	#name : 'MTReplaceOrWithTrueOperator',
	#superclass : 'MTParseRewriterMutantOperator',
	#category : 'MuTalk-Model-Operators - Logical boolean operation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Logical boolean operation'
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
