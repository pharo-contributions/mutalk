Class {
	#name : 'MTReplaceOrReceiverOperator',
	#superclass : 'MTReplaceReceiverOperator',
	#category : 'MuTalk-Model-Operators - Logical boolean operation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Logical boolean operation'
}

{ #category : 'testing' }
MTReplaceOrReceiverOperator class >> isAbstract [

	^ self == MTReplaceOrReceiverOperator
]

{ #category : 'applying' }
MTReplaceOrReceiverOperator >> selector [
	^#or:
]
