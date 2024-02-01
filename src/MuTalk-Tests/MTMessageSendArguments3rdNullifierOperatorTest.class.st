Class {
	#name : 'MTMessageSendArguments3rdNullifierOperatorTest',
	#superclass : 'MTMutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MTMessageSendArguments3rdNullifierOperatorTest >> methodWithNoSenders [

	^ self operatorDescription 
]

{ #category : 'accessing' }
MTMessageSendArguments3rdNullifierOperatorTest >> methodWithOneSender [

	| o |
	o := OrderedCollection new.
	o at: 1 put: 2.
	o collect: [:s | s] from: 0 to: 2.
	o at: 1 put: 2
]

{ #category : 'accessing' }
MTMessageSendArguments3rdNullifierOperatorTest >> methodWithOneSenderModified [

	| o |
	o := OrderedCollection new.
	o at: 1 put: 2.
	o collect: [ :s | s ] from: 0 to: nil.
	o at: 1 put: 2
]

{ #category : 'accessing' }
MTMessageSendArguments3rdNullifierOperatorTest >> methodWithTwoSenders [

	| o |
	o := OrderedCollection new.
	o at: 1 put: 2.
	o collect: [ :s | s ] from: 0 to: 2.
	o collect: [ :s | s ] from: 0 to: 2.
	o at: 1 put: 2
]

{ #category : 'accessing' }
MTMessageSendArguments3rdNullifierOperatorTest >> methodWithTwoSendersModifiedFirst [

	| o |
	o := OrderedCollection new.
	o at: 1 put: 2.
	o collect: [ :s | s ] from: 0 to: nil.
	o collect: [ :s | s ] from: 0 to: 2.
	o at: 1 put: 2
]

{ #category : 'accessing' }
MTMessageSendArguments3rdNullifierOperatorTest >> methodWithTwoSendersModifiedSecond [

	| o |
	o := OrderedCollection new.
	o at: 1 put: 2.
	o collect: [ :s | s ] from: 0 to: 2.
	o collect: [ :s | s ] from: 0 to: nil.
	o at: 1 put: 2
]

{ #category : 'accessing' }
MTMessageSendArguments3rdNullifierOperatorTest >> operator [

	^ MTMessageSendArguments3rdNullifierOperator new
]
