Class {
	#name : 'MTMessageSendToYourselfOperatorTest',
	#superclass : 'MTMutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MTMessageSendToYourselfOperatorTest >> methodWithNoSenders [

	^ 1
]

{ #category : 'accessing' }
MTMessageSendToYourselfOperatorTest >> methodWithOneSender [

	self operator
]

{ #category : 'accessing' }
MTMessageSendToYourselfOperatorTest >> methodWithOneSenderModified [

	self yourself
]

{ #category : 'accessing' }
MTMessageSendToYourselfOperatorTest >> methodWithTwoSenders [

	 | dict |
dict:= Dictionary new. dict at: 1 put: 2
]

{ #category : 'accessing' }
MTMessageSendToYourselfOperatorTest >> methodWithTwoSendersModifiedFirst [

	| dict |
	dict := Dictionary yourself.
	dict at: 1 put: 2
]

{ #category : 'accessing' }
MTMessageSendToYourselfOperatorTest >> methodWithTwoSendersModifiedSecond [

	| dict |
	dict := Dictionary new.
	dict yourself
]

{ #category : 'accessing' }
MTMessageSendToYourselfOperatorTest >> operator [

	^ MTMessageSendToYourselfOperator new
]

{ #category : 'accessing' }
MTMessageSendToYourselfOperatorTest >> operatorDescription [

	^ self operator  description
]
