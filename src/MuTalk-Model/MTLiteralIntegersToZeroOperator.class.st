Class {
	#name : 'MTLiteralIntegersToZeroOperator',
	#superclass : 'MTPredicateBasedMutantOperator',
	#category : 'MuTalk-Model-Operators - Literal manipulation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Literal manipulation'
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

{ #category : 'printing' }
MTLiteralIntegersToZeroOperator >> expressionToReplace [

	^'``@anInteger'
]

{ #category : 'printing' }
MTLiteralIntegersToZeroOperator >> newExpression [

	^'0'
]

{ #category : 'applying' }
MTLiteralIntegersToZeroOperator >> newNodeFrom: anOldNode [

	^ RBLiteralValueNode value: 0
]
