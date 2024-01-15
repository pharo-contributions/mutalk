Class {
	#name : 'MTReplaceDoBlockWithEmptyBlockOperator',
	#superclass : 'MutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'printing' }
MTReplaceDoBlockWithEmptyBlockOperator >> description [
	^'Replace do block with [:each |]'.
]

{ #category : 'applying' }
MTReplaceDoBlockWithEmptyBlockOperator >> expressionToReplace [ 
	^'``@collection do: ``@aBlock'
]

{ #category : 'applying' }
MTReplaceDoBlockWithEmptyBlockOperator >> newExpression [
	^'``@collection do: [:each | ]'
]

{ #category : 'suggestions' }
MTReplaceDoBlockWithEmptyBlockOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [
	^aMutantKillingSuggestionGenerator suggestionForMutationProducedByADoBlockWithEmptyBlockOperator: aMutation.
]
