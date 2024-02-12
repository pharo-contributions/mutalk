Class {
	#name : 'MTMessageSendToYourselfOperatorTest',
	#superclass : 'MTPredicateBasedMutantOperatorTest',
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
	dict := Dictionary new.
	dict at: 1 put: 2
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
MTMessageSendToYourselfOperatorTest >> newNodeOneSender [

	^ RBSequenceNode statements: { (RBMessageNode
			   receiver: (RBVariableNode named: #self)
			   selector: #yourself) }
]

{ #category : 'accessing' }
MTMessageSendToYourselfOperatorTest >> newNodeTwoSendersFirst [ 

	^ RBSequenceNode statements: { (RBMessageNode
			   receiver: (RBVariableNode named: #Dictionary)
			   selector: #yourself) }
]

{ #category : 'accessing' }
MTMessageSendToYourselfOperatorTest >> newNodeTwoSendersSecond [

	^ RBSequenceNode statements: { (RBMessageNode
			   receiver: (RBVariableNode named: #dict)
			   selector: #yourself) }
]

{ #category : 'accessing' }
MTMessageSendToYourselfOperatorTest >> operator [

	^ MTMessageSendToYourselfOperator new
]
