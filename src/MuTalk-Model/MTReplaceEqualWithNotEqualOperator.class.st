Class {
	#name : 'MTReplaceEqualWithNotEqualOperator',
	#superclass : 'MTSelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators - Relational operation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Relational operation'
}

{ #category : 'applying' }
MTReplaceEqualWithNotEqualOperator >> expressionToReplace [
	^ '`@a = `@b'
]

{ #category : 'applying' }
MTReplaceEqualWithNotEqualOperator >> newExpression [
	^ '`@a ~= `@b'
]

{ #category : 'accessing' }
MTReplaceEqualWithNotEqualOperator >> newSelector [
	^#~=
]

{ #category : 'accessing' }
MTReplaceEqualWithNotEqualOperator >> oldSelector [
	^#=
]
