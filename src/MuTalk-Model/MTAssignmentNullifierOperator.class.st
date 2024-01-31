Class {
	#name : 'MTAssignmentNullifierOperator',
	#superclass : 'MTBlockBasedMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'printing' }
MTAssignmentNullifierOperator >> description [
	
	^ 'Nullify the value assigned'
]

{ #category : 'applying' }
MTAssignmentNullifierOperator >> expressionToReplace [

	^ [ :aNode | aNode isAssignment & aNode value isNotNil ]
]

{ #category : 'applying' }
MTAssignmentNullifierOperator >> newExpression [

	^ [ :anOldNode |
	  | nodeCopy |
	  nodeCopy := anOldNode copy.
	  nodeCopy value: (RBLiteralValueNode value: nil).
	  nodeCopy ]
]
