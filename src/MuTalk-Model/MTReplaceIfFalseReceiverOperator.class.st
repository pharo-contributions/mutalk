Class {
	#name : 'MTReplaceIfFalseReceiverOperator',
	#superclass : 'MTReplaceReceiverOperator',
	#category : 'MuTalk-Model-Operators - Conditional boolean operation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Conditional boolean operation'
}

{ #category : 'testing' }
MTReplaceIfFalseReceiverOperator class >> isAbstract [

	^ self == MTReplaceIfFalseReceiverOperator
]

{ #category : 'applying' }
MTReplaceIfFalseReceiverOperator >> selector [
	^#ifFalse:
]
