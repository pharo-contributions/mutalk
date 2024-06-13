Class {
	#name : 'MTReplaceLessWithGreaterMutantOperator',
	#superclass : 'MTSelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators - Relational operation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Relational operation'
}

{ #category : 'applying' }
MTReplaceLessWithGreaterMutantOperator >> expressionToReplace [
	^ '``@a < ``@b'
]

{ #category : 'applying' }
MTReplaceLessWithGreaterMutantOperator >> newExpression [
	^ '``@a > ``@b'
]

{ #category : 'accessing' }
MTReplaceLessWithGreaterMutantOperator >> newSelector [
	^#>
]

{ #category : 'accessing' }
MTReplaceLessWithGreaterMutantOperator >> oldSelector [
	^#<
]
