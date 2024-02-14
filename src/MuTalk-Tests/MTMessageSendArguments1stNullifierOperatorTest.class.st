Class {
	#name : 'MTMessageSendArguments1stNullifierOperatorTest',
	#superclass : 'MTPredicateBasedMutantOperatorTest',
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
	o at: 1
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
MTMessageSendArguments1stNullifierOperatorTest >> newNodeOneSender [

	^ RBMessageNode
		  receiver: (RBVariableNode named: #o)
		  selector: #at:put:
		  arguments: {
				  (RBLiteralValueNode value: nil).
				  (RBLiteralValueNode value: 2) }
]

{ #category : 'accessing' }
MTMessageSendArguments1stNullifierOperatorTest >> newNodeTwoSendersFirst [

	^ RBMessageNode
		  receiver: (RBVariableNode named: #o)
		  selector: #at:put:
		  arguments: {
				  (RBLiteralValueNode value: nil).
				  (RBLiteralValueNode value: 2) }
]

{ #category : 'accessing' }
MTMessageSendArguments1stNullifierOperatorTest >> newNodeTwoSendersSecond [

	^ RBMessageNode
		  receiver: (RBVariableNode named: #o)
		  selector: #at:
		  arguments: { (RBLiteralValueNode value: nil) }
]

{ #category : 'accessing' }
MTMessageSendArguments1stNullifierOperatorTest >> operator [

	^ MTMessageSendArguments1stNullifierOperator new
]
