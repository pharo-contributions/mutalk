Class {
	#name : #ReplaceIfTrueIfFalseReceiverOperator,
	#superclass : #ReplaceReceiverOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #applying }
ReplaceIfTrueIfFalseReceiverOperator >> selector [
	^#ifTrue:ifFalse:
]
