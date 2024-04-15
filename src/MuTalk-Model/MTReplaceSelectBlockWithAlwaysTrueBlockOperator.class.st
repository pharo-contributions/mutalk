Class {
	#name : 'MTReplaceSelectBlockWithAlwaysTrueBlockOperator',
	#superclass : 'MTParseRewriterMutantOperator',
	#category : 'MuTalk-Model-Operators - Collection operation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Collection operation'
}

{ #category : 'printing' }
MTReplaceSelectBlockWithAlwaysTrueBlockOperator >> description [
	^'Replace Select block with [:each | true]'.
]

{ #category : 'applying' }
MTReplaceSelectBlockWithAlwaysTrueBlockOperator >> expressionToReplace [ 
	^'``@collection select: ``@aBlock'
]

{ #category : 'applying' }
MTReplaceSelectBlockWithAlwaysTrueBlockOperator >> newExpression [
	^'``@collection select: [:each | true]'
]
