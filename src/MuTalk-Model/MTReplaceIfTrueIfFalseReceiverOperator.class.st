Class {
	#name : #MTReplaceIfTrueIfFalseReceiverOperator,
	#superclass : #MTReplaceReceiverOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #testing }
MTReplaceIfTrueIfFalseReceiverOperator class >> isAbstract [

	^ self == MTReplaceIfTrueIfFalseReceiverOperator
]

{ #category : #applying }
MTReplaceIfTrueIfFalseReceiverOperator >> selector [
	^#ifTrue:ifFalse:
]
