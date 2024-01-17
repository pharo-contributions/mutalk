Class {
	#name : 'MTReplaceIfTrueIfFalseReceiverOperator',
	#superclass : 'MTReplaceReceiverOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'testing' }
MTReplaceIfTrueIfFalseReceiverOperator class >> isAbstract [

	^ self == MTReplaceIfTrueIfFalseReceiverOperator
]

{ #category : 'applying' }
MTReplaceIfTrueIfFalseReceiverOperator >> selector [
	^#ifTrue:ifFalse:
]
