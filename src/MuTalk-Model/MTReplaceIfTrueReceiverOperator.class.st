Class {
	#name : 'MTReplaceIfTrueReceiverOperator',
	#superclass : 'MTReplaceReceiverOperator',
	#category : 'MuTalk-Model-Operators - Conditional boolean operation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Conditional boolean operation'
}

{ #category : 'testing' }
MTReplaceIfTrueReceiverOperator class >> isAbstract [

	^ self == MTReplaceIfTrueReceiverOperator
]

{ #category : 'applying' }
MTReplaceIfTrueReceiverOperator >> selector [
	^#ifTrue:
]
