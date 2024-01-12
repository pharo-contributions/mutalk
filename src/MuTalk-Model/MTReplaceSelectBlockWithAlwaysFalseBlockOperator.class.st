Class {
	#name : 'MTReplaceSelectBlockWithAlwaysFalseBlockOperator',
	#superclass : 'MTMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
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
