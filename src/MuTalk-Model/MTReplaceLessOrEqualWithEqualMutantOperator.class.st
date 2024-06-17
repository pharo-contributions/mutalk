Class {
	#name : 'MTReplaceLessOrEqualWithEqualMutantOperator',
	#superclass : 'MTSelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators - Relational operation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Relational operation'
}

{ #category : 'applying' }
MTReplaceLessOrEqualWithEqualMutantOperator >> expressionToReplace [
	^ '`@a <= `@b'
]

{ #category : 'applying' }
MTReplaceLessOrEqualWithEqualMutantOperator >> newExpression [
	^ '`@a = `@b'
]

{ #category : 'accessing' }
MTReplaceLessOrEqualWithEqualMutantOperator >> newSelector [ 
	^#=
]

{ #category : 'accessing' }
MTReplaceLessOrEqualWithEqualMutantOperator >> oldSelector [
	^#<=
]

{ #category : 'suggestions' }
MTReplaceLessOrEqualWithEqualMutantOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [ 
	^ aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceLessOrEqualWithEqualMutantOperator: aMutation
]
