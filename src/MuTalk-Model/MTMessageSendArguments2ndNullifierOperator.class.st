Class {
	#name : 'MTMessageSendArguments2ndNullifierOperator',
	#superclass : 'MTMessageSendArgumentsNullifierOperator',
	#category : 'MuTalk-Model-Operators - Message sender',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Message sender'
}

{ #category : 'printing' }
MTMessageSendArguments2ndNullifierOperator >> expressionToReplace [

	^'`@a `@message: `@b'
]

{ #category : 'printing' }
MTMessageSendArguments2ndNullifierOperator >> newExpression [

	^'`@a `@message: nil'
]

{ #category : 'applying' }
MTMessageSendArguments2ndNullifierOperator >> whichArgument [

	^ 2
]
