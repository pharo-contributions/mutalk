Class {
	#name : 'MTMessageSendToYourselfOperator',
	#superclass : 'MTBlockBasedMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'printing' }
MTMessageSendToYourselfOperator >> description [

	^ 'Change a message send with #yourself'
]

{ #category : 'applying' }
MTMessageSendToYourselfOperator >> expressionToReplace [

	^ [ :aNode | 
	  aNode isMessage and: [ aNode selector ~= #yourself ] ]
]

{ #category : 'applying' }
MTMessageSendToYourselfOperator >> newExpression [

	| nodeCopy |
	^ [ :anOldNode | 
	  nodeCopy := anOldNode copy.
		RBMessageNode receiver: nodeCopy receiver selector: #yourself
	   ]
]
