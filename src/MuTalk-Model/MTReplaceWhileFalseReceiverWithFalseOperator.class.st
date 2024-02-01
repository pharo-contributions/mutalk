Class {
	#name : 'MTReplaceWhileFalseReceiverWithFalseOperator',
	#superclass : 'MTReplaceWhileFalseReceiverOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'applying' }
MTReplaceWhileFalseReceiverWithFalseOperator >> newReceiverExpression [

	^ 'false'
]
