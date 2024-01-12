Class {
	#name : 'MTLiteralIntegersDecreaseOperator',
	#superclass : 'MTBlockBasedMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'printing' }
MTLiteralIntegersDecreaseOperator >> description [

	^ 'Decrease a literal integer'
]

{ #category : 'applying' }
MTLiteralIntegersDecreaseOperator >> expressionToReplace [

	^ [ :aNode | aNode isLiteralNode & aNode isLiteralArray not and: [ aNode value isInteger ]  ]
]

{ #category : 'applying' }
MTLiteralIntegersDecreaseOperator >> newExpression [

	^ [ :anOldNode | RBLiteralValueNode value: anOldNode value - 1 ]
]
