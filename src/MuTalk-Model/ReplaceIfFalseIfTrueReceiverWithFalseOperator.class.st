Class {
	#name : 'ReplaceIfFalseIfTrueReceiverWithFalseOperator',
	#superclass : 'ReplaceIfFalseIfTrueReceiverOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'applying' }
ReplaceIfFalseIfTrueReceiverWithFalseOperator >> newReceiverExpression [ 
	^'false'
]
