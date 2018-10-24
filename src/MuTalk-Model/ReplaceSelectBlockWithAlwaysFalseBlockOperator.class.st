Class {
	#name : #ReplaceSelectBlockWithAlwaysFalseBlockOperator,
	#superclass : #MutantOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #printing }
ReplaceSelectBlockWithAlwaysFalseBlockOperator >> description [
	^'Replace Select block with [:each | false]'.
]

{ #category : #applying }
ReplaceSelectBlockWithAlwaysFalseBlockOperator >> expressionToReplace [ 
	^'``@collection select: ``@aBlock'
]

{ #category : #applying }
ReplaceSelectBlockWithAlwaysFalseBlockOperator >> newExpression [
	^'``@collection select: [:each | false]'
]
