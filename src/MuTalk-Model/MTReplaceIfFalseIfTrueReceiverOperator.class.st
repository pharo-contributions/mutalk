Class {
	#name : 'MTReplaceIfFalseIfTrueReceiverOperator',
	#superclass : 'MTReplaceReceiverOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'testing' }
MTReplaceIfFalseIfTrueReceiverOperator class >> isAbstract [

	^ self == MTReplaceIfFalseIfTrueReceiverOperator
]

{ #category : 'applying' }
MTReplaceIfFalseIfTrueReceiverOperator >> selector [
	^#ifFalse:IfTrue:
]
