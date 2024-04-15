Class {
	#name : 'MTReplaceIfTrueIfFalseReceiverOperator',
	#superclass : 'MTReplaceReceiverOperator',
	#category : 'MuTalk-Model-Operators - Conditional boolean operation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Conditional boolean operation'
}

{ #category : 'testing' }
MTReplaceIfTrueIfFalseReceiverOperator class >> isAbstract [

	^ self == MTReplaceIfTrueIfFalseReceiverOperator
]

{ #category : 'applying' }
MTReplaceIfTrueIfFalseReceiverOperator >> selector [
	^#ifTrue:ifFalse:
]
