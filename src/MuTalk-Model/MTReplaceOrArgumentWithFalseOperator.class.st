Class {
	#name : 'MTReplaceOrArgumentWithFalseOperator',
	#superclass : 'MutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
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
