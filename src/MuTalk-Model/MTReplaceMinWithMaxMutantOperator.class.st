Class {
	#name : 'MTReplaceMinWithMaxMutantOperator',
	#superclass : 'MTSelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators - Relational operation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Relational operation'
}

{ #category : 'applying' }
MTReplaceMinWithMaxMutantOperator >> expressionToReplace [
	^ '`@a min: `@b'
]

{ #category : 'applying' }
MTReplaceMinWithMaxMutantOperator >> newExpression [
	^ '`@a max: `@b'
]

{ #category : 'accessing' }
MTReplaceMinWithMaxMutantOperator >> newSelector [
	^#max:
]

{ #category : 'accessing' }
MTReplaceMinWithMaxMutantOperator >> oldSelector [
	^#min:
]
