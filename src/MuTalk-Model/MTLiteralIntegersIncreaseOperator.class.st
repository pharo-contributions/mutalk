Class {
	#name : 'MTLiteralIntegersIncreaseOperator',
	#superclass : 'MTPredicateBasedMutantOperator',
	#category : 'MuTalk-Model-Operators - Literal manipulation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Literal manipulation'
}

{ #category : 'applying' }
MTLiteralIntegersIncreaseOperator >> appliesToNode: aNode [

	^ aNode isLiteralNode & aNode isLiteralArray not and: [
		  aNode value isInteger ]
]

{ #category : 'printing' }
MTLiteralIntegersIncreaseOperator >> description [

	^ 'Increase a literal integer'
]

{ #category : 'applying' }
MTLiteralIntegersIncreaseOperator >> newNodeFrom: anOldNode [

	^ RBLiteralValueNode value: anOldNode value + 1
]
