Class {
	#name : #LiteralBooleanNegateOperator,
	#superclass : #BlockBasedMutantOperator,
	#category : #'MuTalk-Model-Operators'
}

{ #category : #printing }
LiteralBooleanNegateOperator >> description [

	^ 'Negate a literal boolean'
]

{ #category : #applying }
LiteralBooleanNegateOperator >> expressionToReplace [

	^ [ :aNode | 
	  aNode isLiteralNode & aNode isLiteralArray not and: [ 
		  { true. false } includes: aNode value  ] ]
]

{ #category : #applying }
LiteralBooleanNegateOperator >> newExpression [

	^ [ :anOldNode | RBLiteralValueNode value: anOldNode value not ]
]
