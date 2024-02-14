Class {
	#name : 'MTAssignmentNullifierOperator',
	#superclass : 'MTPredicateBasedMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'applying' }
MTAssignmentNullifierOperator >> appliesToNode: aNode [

	^ aNode isAssignment & aNode value isNotNil
]

{ #category : 'printing' }
MTAssignmentNullifierOperator >> description [
	
	^ 'Nullify the value assigned'
]

{ #category : 'applying' }
MTAssignmentNullifierOperator >> newNodeFrom: anOldNode [

	| nodeCopy |
	nodeCopy := anOldNode copy.
	nodeCopy value: (RBLiteralValueNode value: nil).
	^ nodeCopy
]
