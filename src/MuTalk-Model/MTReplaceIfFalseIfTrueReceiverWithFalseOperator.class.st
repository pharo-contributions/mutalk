Class {
	#name : 'MTReplaceIfFalseIfTrueReceiverWithFalseOperator',
	#superclass : 'MTReplaceIfFalseIfTrueReceiverOperator',
	#category : 'MuTalk-Model-Operators - Conditional boolean operation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Conditional boolean operation'
}

{ #category : 'applying' }
MTReplaceIfFalseIfTrueReceiverWithFalseOperator >> newReceiverExpression [ 
	^'false'
]
