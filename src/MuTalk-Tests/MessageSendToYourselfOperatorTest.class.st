Class {
	#name : 'MessageSendToYourselfOperatorTest',
	#superclass : 'MutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MessageSendToYourselfOperatorTest >> methodWithNoSenders [

	^ 1
]

{ #category : 'accessing' }
MessageSendToYourselfOperatorTest >> methodWithOneSender [

	self operator
]

{ #category : 'accessing' }
MessageSendToYourselfOperatorTest >> methodWithOneSenderModified [

	self yourself
]

{ #category : 'accessing' }
MessageSendToYourselfOperatorTest >> methodWithTwoSenders [

	 | dict |
dict:= Dictionary new. dict at: 1 put: 2
]

{ #category : 'accessing' }
MessageSendToYourselfOperatorTest >> methodWithTwoSendersModifiedFirst [

	| dict |
	dict := Dictionary yourself.
	dict at: 1 put: 2
]

{ #category : 'accessing' }
MessageSendToYourselfOperatorTest >> methodWithTwoSendersModifiedSecond [

	| dict |
	dict := Dictionary new.
	dict yourself
]

{ #category : 'accessing' }
MessageSendToYourselfOperatorTest >> operator [

	^ MessageSendToYourselfOperator new
]

{ #category : 'accessing' }
MessageSendToYourselfOperatorTest >> operatorDescription [

	^ self operator  description
]
