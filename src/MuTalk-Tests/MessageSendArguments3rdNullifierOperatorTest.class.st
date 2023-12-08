Class {
	#name : 'MessageSendArguments3rdNullifierOperatorTest',
	#superclass : 'MutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MessageSendArguments3rdNullifierOperatorTest >> methodWithNoSenders [

	^ self operatorDescription 
]

{ #category : 'accessing' }
MessageSendArguments3rdNullifierOperatorTest >> methodWithOneSender [

	| o |
	o := OrderedCollection new.
	o at: 1 put: 2.
	o collect: [:s | s] from: 0 to: 2.
	o at: 1 put: 2
]

{ #category : 'accessing' }
MessageSendArguments3rdNullifierOperatorTest >> methodWithOneSenderModified [

	| o |
	o := OrderedCollection new.
	o at: 1 put: 2.
	o collect: [ :s | s ] from: 0 to: nil.
	o at: 1 put: 2
]

{ #category : 'accessing' }
MessageSendArguments3rdNullifierOperatorTest >> methodWithTwoSenders [

	| o |
	o := OrderedCollection new.
	o at: 1 put: 2.
	o collect: [ :s | s ] from: 0 to: 2.
	o collect: [ :s | s ] from: 0 to: 2.
	o at: 1 put: 2
]

{ #category : 'accessing' }
MessageSendArguments3rdNullifierOperatorTest >> methodWithTwoSendersModifiedFirst [

	| o |
	o := OrderedCollection new.
	o at: 1 put: 2.
	o collect: [ :s | s ] from: 0 to: nil.
	o collect: [ :s | s ] from: 0 to: 2.
	o at: 1 put: 2
]

{ #category : 'accessing' }
MessageSendArguments3rdNullifierOperatorTest >> methodWithTwoSendersModifiedSecond [

	| o |
	o := OrderedCollection new.
	o at: 1 put: 2.
	o collect: [ :s | s ] from: 0 to: 2.
	o collect: [ :s | s ] from: 0 to: nil.
	o at: 1 put: 2
]

{ #category : 'accessing' }
MessageSendArguments3rdNullifierOperatorTest >> operator [

	^ MessageSendArguments3rdNullifierOperator new
]

{ #category : 'accessing' }
MessageSendArguments3rdNullifierOperatorTest >> operatorDescription [

	^ self operator  description
]
