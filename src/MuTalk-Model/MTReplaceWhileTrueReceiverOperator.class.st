Class {
	#name : 'MTReplaceWhileTrueReceiverOperator',
	#superclass : 'MTReplaceReceiverOperator',
	#category : 'MuTalk-Model-Operators - Conditional boolean operation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Conditional boolean operation'
}

{ #category : 'testing' }
MTReplaceWhileTrueReceiverOperator class >> isAbstract [

	^ self == MTReplaceWhileTrueReceiverOperator
]

{ #category : 'applying' }
MTReplaceWhileTrueReceiverOperator >> selector [

	^ #whileTrue:
]
