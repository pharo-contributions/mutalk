Class {
	#name : 'LiteralIntegersDecreaseOperator',
	#superclass : 'BlockBasedMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'printing' }
LiteralIntegersDecreaseOperator >> description [

	^ 'Decrease a literal integer'
]

{ #category : 'applying' }
LiteralIntegersDecreaseOperator >> expressionToReplace [

	^ [ :aNode | aNode isLiteralNode & aNode isLiteralArray not and: [ aNode value isInteger ]  ]
]

{ #category : 'applying' }
LiteralIntegersDecreaseOperator >> newExpression [

	^ [ :anOldNode | RBLiteralValueNode value: anOldNode value - 1 ]
]
