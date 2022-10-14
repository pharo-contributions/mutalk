Class {
	#name : #LiteralIntegersIncreaseOperator,
	#superclass : #BlockBasedMutantOperator,
	#category : #'MuTalk-Model-Operators'
}

{ #category : #printing }
LiteralIntegersIncreaseOperator >> description [

	^ 'Increase a literal integer'
]

{ #category : #applying }
LiteralIntegersIncreaseOperator >> expressionToReplace [

	^ [ :aNode | aNode isLiteralNode & aNode isLiteralArray not and: [ aNode value isInteger ]  ]
]

{ #category : #applying }
LiteralIntegersIncreaseOperator >> newExpression [

	^ [ :anOldNode | RBLiteralValueNode value: anOldNode value + 1 ]
]
