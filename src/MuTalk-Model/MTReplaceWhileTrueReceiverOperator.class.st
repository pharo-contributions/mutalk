Class {
	#name : 'MTReplaceWhileTrueReceiverOperator',
	#superclass : 'MTReplaceReceiverOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'testing' }
MTReplaceWhileTrueReceiverOperator class >> isAbstract [

	^ self == MTReplaceWhileTrueReceiverOperator
]

{ #category : 'applying' }
MTReplaceWhileTrueReceiverOperator >> selector [

	^ #whileTrue:
]
