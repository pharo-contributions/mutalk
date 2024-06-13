Class {
	#name : 'MTLiteralBooleanNegateOperator',
	#superclass : 'MTPredicateBasedMutantOperator',
	#category : 'MuTalk-Model-Operators - Literal manipulation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Literal manipulation'
}

{ #category : 'applying' }
MTLiteralBooleanNegateOperator >> appliesToNode: aNode [

	^ aNode isLiteralNode & aNode isLiteralArray not and: [
		  { true. false } includes: aNode value ]
]

{ #category : 'printing' }
MTLiteralBooleanNegateOperator >> description [

	^ 'Negate a literal boolean'
]

{ #category : 'printing' }
MTLiteralBooleanNegateOperator >> expressionToReplace [

	^'``@aBoolean'
]

{ #category : 'printing' }
MTLiteralBooleanNegateOperator >> newExpression [

	^'``@aBoolean not'
]

{ #category : 'applying' }
MTLiteralBooleanNegateOperator >> newNodeFrom: anOldNode [

	^ RBLiteralValueNode value: anOldNode value not
]
