Class {
	#name : 'MTReplaceLessOrEqualWithGreaterMutantOperator',
	#superclass : 'MTSelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators - Relational operation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Relational operation'
}

{ #category : 'applying' }
MTReplaceLessOrEqualWithGreaterMutantOperator >> expressionToReplace [
	^ '``@a <= ``@b'
]

{ #category : 'applying' }
MTReplaceLessOrEqualWithGreaterMutantOperator >> newExpression [
	^ '``@a > ``@b'
]

{ #category : 'accessing' }
MTReplaceLessOrEqualWithGreaterMutantOperator >> newSelector [
	^#>
]

{ #category : 'accessing' }
MTReplaceLessOrEqualWithGreaterMutantOperator >> oldSelector [
	^#<=
]
