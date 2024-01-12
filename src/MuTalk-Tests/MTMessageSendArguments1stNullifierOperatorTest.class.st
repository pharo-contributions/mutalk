Class {
	#name : 'MTMessageSendArguments1stNullifierOperatorTest',
	#superclass : 'MTMutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MTMessageSendArguments1stNullifierOperatorTest >> methodWithNoSenders [

	^ self operatorDescription 
]

{ #category : 'accessing' }
MTMessageSendArguments1stNullifierOperatorTest >> methodWithOneSender [

	| o |
	o := OrderedCollection new.
	o at: 1 put: 2.
]

{ #category : 'accessing' }
MTMessageSendArguments1stNullifierOperatorTest >> methodWithOneSenderModified [

	
	| o |
	o := OrderedCollection new.
	o at: nil put: 2
]

{ #category : 'accessing' }
MTMessageSendArguments1stNullifierOperatorTest >> methodWithTwoSenders [

	
	| o |
	o := OrderedCollection new.
	o at: 1 put: 2.
	o at: 1 .
]

{ #category : 'accessing' }
MTMessageSendArguments1stNullifierOperatorTest >> methodWithTwoSendersModifiedFirst [

	| o |
	o := OrderedCollection new.
	o at: nil put: 2.
	o at: 1
]

{ #category : 'accessing' }
MTMessageSendArguments1stNullifierOperatorTest >> methodWithTwoSendersModifiedSecond [

	| o |
	o := OrderedCollection new.
	o at: 1 put: 2.
	o at: nil
]

{ #category : 'accessing' }
MTMessageSendArguments1stNullifierOperatorTest >> operator [

	^ MessageSendArguments1stNullifierOperator new
]

{ #category : 'accessing' }
MTMessageSendArguments1stNullifierOperatorTest >> operatorDescription [

	^ self operator  description
]
