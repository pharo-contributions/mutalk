Class {
	#name : #MTReplaceSelectBlockWithAlwaysFalseBlockOperator,
	#superclass : #MTParseRewriterMutantOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #printing }
MTReplaceSelectBlockWithAlwaysFalseBlockOperator >> description [
	^'Replace Select block with [:each | false]'.
]

{ #category : #applying }
MTReplaceSelectBlockWithAlwaysFalseBlockOperator >> expressionToReplace [ 
	^'``@collection select: ``@aBlock'
]

{ #category : #applying }
MTReplaceSelectBlockWithAlwaysFalseBlockOperator >> newExpression [
	^'``@collection select: [:each | false]'
]
