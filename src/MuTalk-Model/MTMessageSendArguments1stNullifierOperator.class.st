Class {
	#name : 'MTMessageSendArguments1stNullifierOperator',
	#superclass : 'MTMessageSendArgumentsNullifierOperator',
	#category : 'MuTalk-Model-Operators - Message sender',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Message sender'
}

{ #category : 'printing' }
MTMessageSendArguments1stNullifierOperator >> expressionToReplace [

	^'`@a `@message'
]

{ #category : 'printing' }
MTMessageSendArguments1stNullifierOperator >> newExpression [

	^'nil `@message'
]

{ #category : 'applying' }
MTMessageSendArguments1stNullifierOperator >> whichArgument [

	^ 1
]
