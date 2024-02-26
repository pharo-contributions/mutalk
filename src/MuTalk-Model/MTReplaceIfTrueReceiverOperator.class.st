Class {
	#name : #MTReplaceIfTrueReceiverOperator,
	#superclass : #MTReplaceReceiverOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #testing }
MTReplaceIfTrueReceiverOperator class >> isAbstract [

	^ self == MTReplaceIfTrueReceiverOperator
]

{ #category : #applying }
MTReplaceIfTrueReceiverOperator >> selector [
	^#ifTrue:
]
