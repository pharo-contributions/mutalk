Class {
	#name : 'MTReplaceDoBlockWithEmptyBlockOperator',
	#superclass : 'MTParseRewriterMutantOperator',
	#category : 'MuTalk-Model-Operators - Collection operation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Collection operation'
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
