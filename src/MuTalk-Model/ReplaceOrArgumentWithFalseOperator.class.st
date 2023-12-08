Class {
	#name : 'ReplaceOrArgumentWithFalseOperator',
	#superclass : 'MutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'printing' }
ReplaceOrArgumentWithFalseOperator >> description [
	^'Replace #or: argument with [false]'
]

{ #category : 'applying' }
ReplaceOrArgumentWithFalseOperator >> expressionToReplace [ 
	^'``@object or: ``@aBlock'
]

{ #category : 'applying' }
ReplaceOrArgumentWithFalseOperator >> newExpression [
	^'``@object or: [false]'
]

{ #category : 'suggestions' }
ReplaceOrArgumentWithFalseOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [
	^aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceOrArgumentWithFalseOperator: aMutation.
]
