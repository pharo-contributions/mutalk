Class {
	#name : 'MTReplaceOrReceiverOperator',
	#superclass : 'MTReplaceReceiverOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'testing' }
MTReplaceOrReceiverOperator class >> isAbstract [

	^ self == MTReplaceOrReceiverOperator
]

{ #category : 'applying' }
MTReplaceOrReceiverOperator >> selector [
	^#or:
]
