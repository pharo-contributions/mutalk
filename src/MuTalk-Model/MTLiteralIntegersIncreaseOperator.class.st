Class {
	#name : 'MTLiteralIntegersIncreaseOperator',
	#superclass : 'MTBlockBasedMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'printing' }
MTLiteralIntegersIncreaseOperator >> description [

	^ 'Increase a literal integer'
]

{ #category : 'applying' }
MTLiteralIntegersIncreaseOperator >> expressionToReplace [

	^ [ :aNode | aNode isLiteralNode & aNode isLiteralArray not and: [ aNode value isInteger ]  ]
]

{ #category : 'applying' }
MTLiteralIntegersIncreaseOperator >> newExpression [

	^ [ :anOldNode | RBLiteralValueNode value: anOldNode value + 1 ]
]
