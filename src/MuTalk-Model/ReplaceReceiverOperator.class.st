Class {
	#name : 'ReplaceReceiverOperator',
	#superclass : 'MutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'printing' }
ReplaceReceiverOperator >> description [
	^'Replace ', self selector printString,' receiver with ', self newReceiverExpression.
]

{ #category : 'applying' }
ReplaceReceiverOperator >> expressionToReplace [ 
	^'``@receiver', ' ', self messageSendExpression.
]

{ #category : 'applying' }
ReplaceReceiverOperator >> messageSendExpression [
	| numberOfArgument |
	numberOfArgument := 0.
	^ self selector keywords
		inject: ''
		into: [:expression :keyword | 
			numberOfArgument := numberOfArgument + 1.
			expression , keyword , ' ``@arg' , numberOfArgument asString , ' ']
]

{ #category : 'applying' }
ReplaceReceiverOperator >> newExpression [
	^self newReceiverExpression, ' ', self messageSendExpression.
]

{ #category : 'applying' }
ReplaceReceiverOperator >> newReceiverExpression [
	self subclassResponsibility
]

{ #category : 'applying' }
ReplaceReceiverOperator >> selector [
	self subclassResponsibility
]
