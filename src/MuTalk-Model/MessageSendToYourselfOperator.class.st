Class {
	#name : 'MessageSendToYourselfOperator',
	#superclass : 'BlockBasedMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'printing' }
MessageSendToYourselfOperator >> description [

	^ 'Chnage a message send with #yourself'
]

{ #category : 'applying' }
MessageSendToYourselfOperator >> expressionToReplace [

	^ [ :aNode | 
	  aNode isMessage and: [ aNode selector ~= #yourself ] ]
]

{ #category : 'applying' }
MessageSendToYourselfOperator >> newExpression [

	| nodeCopy |
	^ [ :anOldNode | 
	  nodeCopy := anOldNode copy.
		RBMessageNode receiver: nodeCopy receiver selector: #yourself
	   ]
]
