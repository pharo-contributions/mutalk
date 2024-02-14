Class {
	#name : 'MTReplaceReceiverOperator',
	#superclass : 'MTParseRewriterMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'testing' }
MTReplaceReceiverOperator class >> isAbstract [

	^ self == MTReplaceReceiverOperator
]

{ #category : 'printing' }
MTReplaceReceiverOperator >> description [
	^'Replace ', self selector printString,' receiver with ', self newReceiverExpression.
]

{ #category : 'applying' }
MTReplaceReceiverOperator >> expressionToReplace [ 
	^'``@receiver', ' ', self messageSendExpression.
]

{ #category : 'applying' }
MTReplaceReceiverOperator >> messageSendExpression [
	| numberOfArgument |
	numberOfArgument := 0.
	^ self selector keywords
		inject: ''
		into: [:expression :keyword | 
			numberOfArgument := numberOfArgument + 1.
			expression , keyword , ' ``@arg' , numberOfArgument asString , ' ']
]

{ #category : 'applying' }
MTReplaceReceiverOperator >> newExpression [
	^self newReceiverExpression, ' ', self messageSendExpression.
]

{ #category : 'applying' }
MTReplaceReceiverOperator >> newReceiverExpression [
	self subclassResponsibility
]

{ #category : 'applying' }
MTReplaceReceiverOperator >> selector [
	self subclassResponsibility
]
