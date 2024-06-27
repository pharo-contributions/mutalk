Class {
	#name : 'MTReplaceGreaterWithLessMutantOperator',
	#superclass : 'MTSelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators - Relational operation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Relational operation'
}

{ #category : 'applying' }
MTReplaceGreaterWithLessMutantOperator >> expressionToReplace [
	^ '`@a > `@b'
]

{ #category : 'applying' }
MTReplaceGreaterWithLessMutantOperator >> newExpression [
	^ '`@a < `@b'
]

{ #category : 'accessing' }
MTReplaceGreaterWithLessMutantOperator >> newSelector [
	^#<
]

{ #category : 'accessing' }
MTReplaceGreaterWithLessMutantOperator >> oldSelector [
	^#>
]
