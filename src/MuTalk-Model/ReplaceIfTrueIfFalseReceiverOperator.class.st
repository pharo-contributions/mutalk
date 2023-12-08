Class {
	#name : 'ReplaceIfTrueIfFalseReceiverOperator',
	#superclass : 'ReplaceReceiverOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'applying' }
ReplaceIfTrueIfFalseReceiverOperator >> selector [
	^#ifTrue:ifFalse:
]
