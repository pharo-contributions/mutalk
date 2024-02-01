Class {
	#name : 'MTReplaceWhileTrueReceiverWithFalseOperator',
	#superclass : 'MTReplaceWhileTrueReceiverOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'applying' }
MTReplaceWhileTrueReceiverWithFalseOperator >> newReceiverExpression [

	^ 'false'
]
