Class {
	#name : 'MTReplaceWhileTrueReceiverWithTrueOperator',
	#superclass : 'MTReplaceWhileTrueReceiverOperator',
	#category : 'MuTalk-Model-Operators - Conditional boolean operation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Conditional boolean operation'
}

{ #category : 'applying' }
MTReplaceWhileTrueReceiverWithTrueOperator >> newReceiverExpression [

	^ 'true'
]
