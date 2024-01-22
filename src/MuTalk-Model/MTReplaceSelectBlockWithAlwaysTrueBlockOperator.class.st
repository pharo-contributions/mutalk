Class {
	#name : 'MTReplaceSelectBlockWithAlwaysTrueBlockOperator',
	#superclass : 'MTMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
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
