Class {
	#name : 'MTMessageSendArguments1stNullifierOperator',
	#superclass : 'MTMessageSendArgumentsNullifierOperator',
	#category : 'MuTalk-Model-Operators - Message sender',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Message sender'
}

{ #category : 'printing' }
MTMessageSendArguments1stNullifierOperator >> expressionToReplace [

	^'`@a `@messages: `@b'
]

{ #category : 'printing' }
MTMessageSendArguments1stNullifierOperator >> newExpression [

	^'nil `@messages: `@b'
]

{ #category : 'applying' }
MTMessageSendArguments1stNullifierOperator >> whichArgument [

	^ 1
]
