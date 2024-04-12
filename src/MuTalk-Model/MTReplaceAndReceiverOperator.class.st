Class {
	#name : 'MTReplaceAndReceiverOperator',
	#superclass : 'MTReplaceReceiverOperator',
	#category : 'MuTalk-Model-Operators - Logical boolean operation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Logical boolean operation'
}

{ #category : 'testing' }
MTReplaceAndReceiverOperator class >> isAbstract [

	^ self == MTReplaceAndReceiverOperator
]

{ #category : 'applying' }
MTReplaceAndReceiverOperator >> selector [
	^#and:
]
