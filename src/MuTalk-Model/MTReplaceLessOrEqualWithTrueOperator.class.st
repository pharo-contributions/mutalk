Class {
	#name : 'MTReplaceLessOrEqualWithTrueOperator',
	#superclass : 'MutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
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
