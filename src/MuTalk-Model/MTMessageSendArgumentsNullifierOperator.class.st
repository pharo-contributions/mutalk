Class {
	#name : #MTMessageSendArgumentsNullifierOperator,
	#superclass : #MTPredicateBasedMutantOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #testing }
MTMessageSendArgumentsNullifierOperator class >> isAbstract [

	^ self == MTMessageSendArgumentsNullifierOperator
]

{ #category : #applying }
MTMessageSendArgumentsNullifierOperator >> appliesToNode: aNode [

	^ aNode isMessage and: [ aNode arguments size >= self whichArgument ]
]

{ #category : #printing }
MTMessageSendArgumentsNullifierOperator >> description [

	^ 'Nullify the arguments of message sends'
]

{ #category : #applying }
MTMessageSendArgumentsNullifierOperator >> newNodeFrom: anOldNode [

	| nodeCopy whichToReplace |
	nodeCopy := anOldNode copy.
	whichToReplace := nodeCopy arguments at: self whichArgument.
	whichToReplace replaceWith: (RBLiteralValueNode value: nil).
	^ nodeCopy
]

{ #category : #applying }
MTMessageSendArgumentsNullifierOperator >> whichArgument [
	^ self subclassResponsibility 
]
