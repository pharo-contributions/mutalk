Class {
	#name : 'MTReplaceOrArgumentWithFalseOperator',
	#superclass : 'MTParseRewriterMutantOperator',
	#category : 'MuTalk-Model-Operators - Logical boolean operation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Logical boolean operation'
}

{ #category : 'printing' }
MTReplaceOrArgumentWithFalseOperator >> description [
	^'Replace #or: argument with [false]'
]

{ #category : 'applying' }
MTReplaceOrArgumentWithFalseOperator >> expressionToReplace [ 
	^'``@object or: ``@aBlock'
]

{ #category : 'applying' }
MTReplaceOrArgumentWithFalseOperator >> newExpression [
	^'``@object or: [false]'
]

{ #category : 'suggestions' }
MTReplaceOrArgumentWithFalseOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [
	^aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceOrArgumentWithFalseOperator: aMutation.
]
