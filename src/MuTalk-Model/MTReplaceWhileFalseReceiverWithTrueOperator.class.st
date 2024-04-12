Class {
	#name : 'MTReplaceWhileFalseReceiverWithTrueOperator',
	#superclass : 'MTReplaceWhileFalseReceiverOperator',
	#category : 'MuTalk-Model-Operators - Conditional boolean operation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Conditional boolean operation'
}

{ #category : 'applying' }
MTReplaceWhileFalseReceiverWithTrueOperator >> newReceiverExpression [

	^ 'true'
]
