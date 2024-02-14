Class {
	#name : 'MTAssignmentNullifierOperatorTest',
	#superclass : 'MTPredicateBasedMutantOperatorTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MTAssignmentNullifierOperatorTest >> methodWithNoSenders [

	^ 1 + 2
]

{ #category : 'accessing' }
MTAssignmentNullifierOperatorTest >> methodWithOneSender [

	| i |
	i := 1
]

{ #category : 'accessing' }
MTAssignmentNullifierOperatorTest >> methodWithOneSenderModified [

	| i |
	i := nil
]

{ #category : 'accessing' }
MTAssignmentNullifierOperatorTest >> methodWithTwoSenders [

	| i j |
	i := 1.
	j := 2
]

{ #category : 'accessing' }
MTAssignmentNullifierOperatorTest >> methodWithTwoSendersModifiedFirst [

	| i j |
	i := nil.
	j := 2
]

{ #category : 'accessing' }
MTAssignmentNullifierOperatorTest >> methodWithTwoSendersModifiedSecond [

	| i j |
	i := 1.
	j := nil
]

{ #category : 'accessing' }
MTAssignmentNullifierOperatorTest >> newNodeOneSender [

	^ RBAssignmentNode
		  variable: (RBVariableNode named: #i)
		  value: (RBLiteralValueNode value: nil)
]

{ #category : 'accessing' }
MTAssignmentNullifierOperatorTest >> newNodeTwoSendersFirst [

	^ RBAssignmentNode
		  variable: (RBVariableNode named: #i)
		  value: (RBLiteralValueNode value: nil)
]

{ #category : 'accessing' }
MTAssignmentNullifierOperatorTest >> newNodeTwoSendersSecond [

	^ RBAssignmentNode
		  variable: (RBVariableNode named: #j)
		  value: (RBLiteralValueNode value: nil)
]

{ #category : 'accessing' }
MTAssignmentNullifierOperatorTest >> operator [

	^ MTAssignmentNullifierOperator new
]
