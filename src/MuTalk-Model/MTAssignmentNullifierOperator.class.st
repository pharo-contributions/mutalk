Class {
	#name : 'MTAssignmentNullifierOperator',
	#superclass : 'MTPredicateBasedMutantOperator',
	#category : 'MuTalk-Model-Operators - Other',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Other'
}

{ #category : 'applying' }
MTAssignmentNullifierOperator >> appliesToNode: aNode [

	^ aNode isAssignment & aNode value isNotNil
]

{ #category : 'printing' }
MTAssignmentNullifierOperator >> description [
	
	^ 'Nullify the value assigned'
]

{ #category : 'printing' }
MTAssignmentNullifierOperator >> expressionToReplace [
	^ '`@a := `@value'
]

{ #category : 'printing' }
MTAssignmentNullifierOperator >> newExpression [
	^ '`@a := nil'
]

{ #category : 'applying' }
MTAssignmentNullifierOperator >> newNodeFrom: anOldNode [

	| nodeCopy |
	nodeCopy := anOldNode copy.
	nodeCopy value: (RBLiteralValueNode value: nil).
	^ nodeCopy
]
