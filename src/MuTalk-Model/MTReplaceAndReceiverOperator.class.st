Class {
	#name : #MTReplaceAndReceiverOperator,
	#superclass : #MTReplaceReceiverOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #testing }
MTReplaceAndReceiverOperator class >> isAbstract [

	^ self == MTReplaceAndReceiverOperator
]

{ #category : #applying }
MTReplaceAndReceiverOperator >> selector [
	^#and:
]
