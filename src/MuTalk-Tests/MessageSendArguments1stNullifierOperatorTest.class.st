Class {
	#name : #MessageSendArguments1stNullifierOperatorTest,
	#superclass : #MutantOperatorTest,
	#category : #'MuTalk-Tests'
}

{ #category : #accessing }
MessageSendArguments1stNullifierOperatorTest >> methodWithNoSenders [

	^ self operatorDescription 
]

{ #category : #accessing }
MessageSendArguments1stNullifierOperatorTest >> methodWithOneSender [

	| o |
	o := OrderedCollection new.
	o at: 1 put: 2.
]

{ #category : #accessing }
MessageSendArguments1stNullifierOperatorTest >> methodWithOneSenderModified [

	
	| o |
	o := OrderedCollection new.
	o at: nil put: 2
]

{ #category : #accessing }
MessageSendArguments1stNullifierOperatorTest >> methodWithTwoSenders [

	
	| o |
	o := OrderedCollection new.
	o at: 1 put: 2.
	o at: 1 .
]

{ #category : #accessing }
MessageSendArguments1stNullifierOperatorTest >> methodWithTwoSendersModifiedFirst [

	| o |
	o := OrderedCollection new.
	o at: nil put: 2.
	o at: 1
]

{ #category : #accessing }
MessageSendArguments1stNullifierOperatorTest >> methodWithTwoSendersModifiedSecond [

	| o |
	o := OrderedCollection new.
	o at: 1 put: 2.
	o at: nil
]

{ #category : #accessing }
MessageSendArguments1stNullifierOperatorTest >> operator [

	^ MessageSendArguments1stNullifierOperator new
]

{ #category : #accessing }
MessageSendArguments1stNullifierOperatorTest >> operatorDescription [

	^ self operator  description
]
