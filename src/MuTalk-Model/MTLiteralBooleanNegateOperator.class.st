Class {
	#name : 'MTLiteralBooleanNegateOperator',
	#superclass : 'MTBlockBasedMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'printing' }
MTLiteralBooleanNegateOperator >> description [

	^ 'Negate a literal boolean'
]

{ #category : 'applying' }
MTLiteralBooleanNegateOperator >> newExpression [

	^ [ :anOldNode | RBLiteralValueNode value: anOldNode value not ]
]

{ #category : 'applying' }
MTLiteralBooleanNegateOperator >> nodeSelectionPredicate [

	^ [ :aNode | 
	  aNode isLiteralNode & aNode isLiteralArray not and: [ 
		  { true. false } includes: aNode value  ] ]
]
