Class {
	#name : 'MTReplaceWhileFalseReceiverWithTrueOperator',
	#superclass : 'MTReplaceWhileFalseReceiverOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'applying' }
MTReplaceWhileFalseReceiverWithTrueOperator >> newReceiverExpression [

	^ 'true'
]
