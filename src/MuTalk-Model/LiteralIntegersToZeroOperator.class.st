Class {
	#name : #LiteralIntegersToZeroOperator,
	#superclass : #BlockBasedMutantOperator,
	#category : #'MuTalk-Model-Operators'
}

{ #category : #printing }
LiteralIntegersToZeroOperator >> description [

	^ 'Convert a literal integer to zero'
]

{ #category : #applying }
LiteralIntegersToZeroOperator >> expressionToReplace [

	^ [ :aNode | 
	  aNode isLiteralNode & aNode isLiteralArray not and: [ 
		  aNode value isInteger & aNode value isZero not ] ]
]

{ #category : #applying }
LiteralIntegersToZeroOperator >> newExpression [

	^ [ :anOldNode | RBLiteralValueNode value: 0 ]
]
