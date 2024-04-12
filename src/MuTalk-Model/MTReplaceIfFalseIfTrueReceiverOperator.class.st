Class {
	#name : 'MTReplaceIfFalseIfTrueReceiverOperator',
	#superclass : 'MTReplaceReceiverOperator',
	#category : 'MuTalk-Model-Operators - Conditional boolean operation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Conditional boolean operation'
}

{ #category : 'testing' }
MTReplaceIfFalseIfTrueReceiverOperator class >> isAbstract [

	^ self == MTReplaceIfFalseIfTrueReceiverOperator
]

{ #category : 'applying' }
MTReplaceIfFalseIfTrueReceiverOperator >> selector [
	^#ifFalse:IfTrue:
]
