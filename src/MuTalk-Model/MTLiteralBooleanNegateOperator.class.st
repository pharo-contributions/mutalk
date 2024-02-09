Class {
	#name : 'MTLiteralBooleanNegateOperator',
	#superclass : 'MTPredicateBasedMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
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

{ #category : 'applying' }
MTLiteralBooleanNegateOperator >> newExpression [

	^ [ :anOldNode | RBLiteralValueNode value: anOldNode value not ]
]
