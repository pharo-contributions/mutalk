Class {
	#name : #MTReplaceIfFalseReceiverOperator,
	#superclass : #MTReplaceReceiverOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #testing }
MTReplaceIfFalseReceiverOperator class >> isAbstract [

	^ self == MTReplaceIfFalseReceiverOperator
]

{ #category : #applying }
MTReplaceIfFalseReceiverOperator >> selector [
	^#ifFalse:
]
