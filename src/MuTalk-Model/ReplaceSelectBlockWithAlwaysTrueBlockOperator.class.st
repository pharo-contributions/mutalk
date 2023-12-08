Class {
	#name : 'ReplaceSelectBlockWithAlwaysTrueBlockOperator',
	#superclass : 'MutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'printing' }
ReplaceSelectBlockWithAlwaysTrueBlockOperator >> description [
	^'Replace Select block with [:each | true]'.
]

{ #category : 'applying' }
ReplaceSelectBlockWithAlwaysTrueBlockOperator >> expressionToReplace [ 
	^'``@collection select: ``@aBlock'
]

{ #category : 'applying' }
ReplaceSelectBlockWithAlwaysTrueBlockOperator >> newExpression [
	^'``@collection select: [:each | true]'
]
