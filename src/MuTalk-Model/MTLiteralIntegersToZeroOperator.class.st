Class {
	#name : 'MTLiteralIntegersToZeroOperator',
	#superclass : 'MTPredicateBasedMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'applying' }
MTLiteralIntegersToZeroOperator >> appliesToNode: aNode [

	^ aNode isLiteralNode & aNode isLiteralArray not and: [
		  aNode value isInteger and: [ aNode value isZero not ] ]
]

{ #category : 'printing' }
MTLiteralIntegersToZeroOperator >> description [

	^ 'Convert a literal integer to zero'
]

{ #category : 'applying' }
MTLiteralIntegersToZeroOperator >> newNodeFrom: anOldNode [

	^ RBLiteralValueNode value: 0
]
