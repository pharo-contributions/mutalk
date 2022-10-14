Class {
	#name : #MessageSendArgumentsNullifierOperator,
	#superclass : #BlockBasedMutantOperator,
	#category : #'MuTalk-Model-Operators'
}

{ #category : #printing }
MessageSendArgumentsNullifierOperator >> description [

	^ 'Nullify the arguments of message sends'
]

{ #category : #applying }
MessageSendArgumentsNullifierOperator >> expressionToReplace [

	^ [ :aNode | 
	  aNode isMessage and: [ aNode arguments size >= self whichArgument ] ]
]

{ #category : #applying }
MessageSendArgumentsNullifierOperator >> newExpression [

	| whichToReplace nodeCopy |
	^ [ :anOldNode | 
	  nodeCopy := anOldNode copy.
	  whichToReplace := nodeCopy arguments at: self whichArgument.
	  whichToReplace replaceWith: (RBLiteralValueNode value: nil).
	 nodeCopy]
]

{ #category : #applying }
MessageSendArgumentsNullifierOperator >> whichArgument [
	^ self subclassResponsibility 
]
