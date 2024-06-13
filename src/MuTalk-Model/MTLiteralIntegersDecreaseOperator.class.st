Class {
	#name : 'MTLiteralIntegersDecreaseOperator',
	#superclass : 'MTPredicateBasedMutantOperator',
	#category : 'MuTalk-Model-Operators - Literal manipulation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Literal manipulation'
}

{ #category : 'applying' }
MTLiteralIntegersDecreaseOperator >> appliesToNode: aNode [

	^ aNode isLiteralNode & aNode isLiteralArray not and: [
		  aNode value isInteger ]
]

{ #category : 'printing' }
MTLiteralIntegersDecreaseOperator >> description [

	^ 'Decrease a literal integer'
]

{ #category : 'printing' }
MTLiteralIntegersDecreaseOperator >> expressionToReplace [

	^'``@anInteger'
]

{ #category : 'printing' }
MTLiteralIntegersDecreaseOperator >> newExpression [

	^'``@anInteger - 1'
]

{ #category : 'applying' }
MTLiteralIntegersDecreaseOperator >> newNodeFrom: anOldNode [

	^ RBLiteralValueNode value: anOldNode value - 1
]
