Class {
	#name : 'MTReplaceWhileTrueReceiverWithFalseOperator',
	#superclass : 'MTReplaceWhileTrueReceiverOperator',
	#category : 'MuTalk-Model-Operators - Conditional boolean operation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Conditional boolean operation'
}

{ #category : 'applying' }
MTReplaceWhileTrueReceiverWithFalseOperator >> newReceiverExpression [

	^ 'false'
]
