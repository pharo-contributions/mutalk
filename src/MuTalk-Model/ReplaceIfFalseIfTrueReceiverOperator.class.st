Class {
	#name : #ReplaceIfFalseIfTrueReceiverOperator,
	#superclass : #ReplaceReceiverOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #applying }
ReplaceIfFalseIfTrueReceiverOperator >> selector [
	^#ifFalse:IfTrue:
]
