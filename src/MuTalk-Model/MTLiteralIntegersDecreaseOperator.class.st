Class {
	#name : 'MTLiteralIntegersDecreaseOperator',
	#superclass : 'MTPredicateBasedMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
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

{ #category : 'applying' }
MTLiteralIntegersDecreaseOperator >> newExpression [

	^ [ :anOldNode | RBLiteralValueNode value: anOldNode value - 1 ]
]
