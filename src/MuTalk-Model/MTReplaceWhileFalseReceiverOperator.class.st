Class {
	#name : 'MTReplaceWhileFalseReceiverOperator',
	#superclass : 'MTReplaceReceiverOperator',
	#category : 'MuTalk-Model-Operators - Conditional boolean operation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Conditional boolean operation'
}

{ #category : 'testing' }
MTReplaceWhileFalseReceiverOperator class >> isAbstract [

	^ self == MTReplaceWhileFalseReceiverOperator
]

{ #category : 'applying' }
MTReplaceWhileFalseReceiverOperator >> selector [

	^ #whileFalse:
]
