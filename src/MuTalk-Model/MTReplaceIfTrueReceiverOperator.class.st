Class {
	#name : 'MTReplaceIfTrueReceiverOperator',
	#superclass : 'MTReplaceReceiverOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'testing' }
MTReplaceIfTrueReceiverOperator class >> isAbstract [

	^ self == MTReplaceIfTrueReceiverOperator
]

{ #category : 'applying' }
MTReplaceIfTrueReceiverOperator >> selector [
	^#ifTrue:
]
