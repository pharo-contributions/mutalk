Class {
	#name : 'MTReplaceWhileFalseReceiverWithFalseOperator',
	#superclass : 'MTReplaceWhileFalseReceiverOperator',
	#category : 'MuTalk-Model-Operators - Conditional boolean operation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Conditional boolean operation'
}

{ #category : 'applying' }
MTReplaceWhileFalseReceiverWithFalseOperator >> newReceiverExpression [

	^ 'false'
]
