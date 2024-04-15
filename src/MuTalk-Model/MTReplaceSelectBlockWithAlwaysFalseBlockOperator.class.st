Class {
	#name : 'MTReplaceSelectBlockWithAlwaysFalseBlockOperator',
	#superclass : 'MTParseRewriterMutantOperator',
	#category : 'MuTalk-Model-Operators - Collection operation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Collection operation'
}

{ #category : 'printing' }
MTReplaceSelectBlockWithAlwaysFalseBlockOperator >> description [
	^'Replace Select block with [:each | false]'.
]

{ #category : 'applying' }
MTReplaceSelectBlockWithAlwaysFalseBlockOperator >> expressionToReplace [ 
	^'``@collection select: ``@aBlock'
]

{ #category : 'applying' }
MTReplaceSelectBlockWithAlwaysFalseBlockOperator >> newExpression [
	^'``@collection select: [:each | false]'
]
