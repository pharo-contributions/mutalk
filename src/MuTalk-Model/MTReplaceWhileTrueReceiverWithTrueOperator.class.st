Class {
	#name : 'MTReplaceWhileTrueReceiverWithTrueOperator',
	#superclass : 'MTReplaceWhileTrueReceiverOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'applying' }
MTReplaceWhileTrueReceiverWithTrueOperator >> newReceiverExpression [

	^ 'true'
]
