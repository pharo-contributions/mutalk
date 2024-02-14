Class {
	#name : 'MTMessageSendArguments3rdNullifierOperatorTest',
	#superclass : 'MTPredicateBasedMutantOperatorTest',
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
	o collect: [ :s | s ] from: 0 to: 2.
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
MTMessageSendArguments3rdNullifierOperatorTest >> newNodeOneSender [

	^ RBMessageNode
	receiver: (RBVariableNode named: #o)
	selector: #collect:from:to:
	arguments: {
			(RBBlockNode
				 arguments: { (RBVariableNode named: #s) }
				 body: (RBSequenceNode statements: { (RBVariableNode named: #s) })).
			(RBLiteralValueNode value: 0).
			(RBLiteralValueNode value: nil) }
]

{ #category : 'accessing' }
MTMessageSendArguments3rdNullifierOperatorTest >> newNodeTwoSendersFirst [

	^ RBMessageNode
		  receiver: (RBVariableNode named: #o)
		  selector: #collect:from:to:
		  arguments: {
				  (RBBlockNode
					   arguments: { (RBVariableNode named: #s) }
					   body:
					   (RBSequenceNode statements: { (RBVariableNode named: #s) })).
				  (RBLiteralValueNode value: 0).
				  (RBLiteralValueNode value: nil) }
]

{ #category : 'accessing' }
MTMessageSendArguments3rdNullifierOperatorTest >> newNodeTwoSendersSecond [

	^ RBMessageNode
		  receiver: (RBVariableNode named: #o)
		  selector: #collect:from:to:
		  arguments: {
				  (RBBlockNode
					   arguments: { (RBVariableNode named: #s) }
					   body:
					   (RBSequenceNode statements: { (RBVariableNode named: #s) })).
				  (RBLiteralValueNode value: 0).
				  (RBLiteralValueNode value: nil) }
]

{ #category : 'accessing' }
MTMessageSendArguments3rdNullifierOperatorTest >> operator [

	^ MTMessageSendArguments3rdNullifierOperator new
]
