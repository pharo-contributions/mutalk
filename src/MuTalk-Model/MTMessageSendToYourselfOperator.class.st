Class {
	#name : 'MTMessageSendToYourselfOperator',
	#superclass : 'MTPredicateBasedMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'applying' }
MTMessageSendToYourselfOperator >> appliesToNode: aNode [

	^ aNode isMessage and: [ aNode selector ~= #yourself ]
]

{ #category : 'printing' }
MTMessageSendToYourselfOperator >> description [

	^ 'Change a message send with #yourself'
]

{ #category : 'applying' }
MTMessageSendToYourselfOperator >> newNodeFrom: anOldNode [

	| nodeCopy |
	nodeCopy := anOldNode copy.
	^ RBMessageNode receiver: nodeCopy receiver selector: #yourself
]
