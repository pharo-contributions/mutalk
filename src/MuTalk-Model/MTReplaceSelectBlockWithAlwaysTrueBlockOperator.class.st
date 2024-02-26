Class {
	#name : #MTReplaceSelectBlockWithAlwaysTrueBlockOperator,
	#superclass : #MTParseRewriterMutantOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #printing }
MTReplaceSelectBlockWithAlwaysTrueBlockOperator >> description [
	^'Replace Select block with [:each | true]'.
]

{ #category : #applying }
MTReplaceSelectBlockWithAlwaysTrueBlockOperator >> expressionToReplace [ 
	^'``@collection select: ``@aBlock'
]

{ #category : #applying }
MTReplaceSelectBlockWithAlwaysTrueBlockOperator >> newExpression [
	^'``@collection select: [:each | true]'
]
