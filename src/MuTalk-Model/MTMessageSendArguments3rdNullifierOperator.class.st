Class {
	#name : 'MTMessageSendArguments3rdNullifierOperator',
	#superclass : 'MTMessageSendArgumentsNullifierOperator',
	#category : 'MuTalk-Model-Operators - Message sender',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Message sender'
}

{ #category : 'printing' }
MTMessageSendArguments3rdNullifierOperator >> expressionToReplace [

	^'`@a `@message: `@b `@message2: `@c'
]

{ #category : 'printing' }
MTMessageSendArguments3rdNullifierOperator >> newExpression [

	^'`@a `@message: `@b `@message2: nil'
]

{ #category : 'applying' }
MTMessageSendArguments3rdNullifierOperator >> whichArgument [

	^ 3
]
