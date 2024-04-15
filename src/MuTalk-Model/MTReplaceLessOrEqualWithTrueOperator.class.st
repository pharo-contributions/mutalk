Class {
	#name : 'MTReplaceLessOrEqualWithTrueOperator',
	#superclass : 'MTParseRewriterMutantOperator',
	#category : 'MuTalk-Model-Operators - Relational operation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Relational operation'
}

{ #category : 'printing' }
MTReplaceLessOrEqualWithTrueOperator >> description [
	^'Replace #''<='' with true'
]

{ #category : 'applying' }
MTReplaceLessOrEqualWithTrueOperator >> expressionToReplace [ 
	^'``@object <= ``@aBlock'
]

{ #category : 'applying' }
MTReplaceLessOrEqualWithTrueOperator >> newExpression [ 
	^'true'
]

{ #category : 'applying' }
MTReplaceLessOrEqualWithTrueOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [
	^aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceLessOrEqualWithTrueOperator: aMutation.
]
