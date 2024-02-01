Class {
	#name : 'MTReplaceWhileFalseReceiverOperator',
	#superclass : 'MTReplaceReceiverOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'testing' }
MTReplaceWhileFalseReceiverOperator class >> isAbstract [

	^ self == MTReplaceWhileFalseReceiverOperator
]

{ #category : 'applying' }
MTReplaceWhileFalseReceiverOperator >> selector [

	^ #whileFalse:
]
