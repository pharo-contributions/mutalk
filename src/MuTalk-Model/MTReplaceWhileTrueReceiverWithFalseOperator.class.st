Class {
	#name : #MTReplaceWhileTrueReceiverWithFalseOperator,
	#superclass : #MTReplaceWhileTrueReceiverOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #applying }
MTReplaceWhileTrueReceiverWithFalseOperator >> newReceiverExpression [

	^ 'false'
]
