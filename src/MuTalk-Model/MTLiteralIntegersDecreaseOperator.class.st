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
MTLiteralIntegersDecreaseOperator >> newExpression [

	^ [ :anOldNode | RBLiteralValueNode value: anOldNode value - 1 ]
]

{ #category : 'applying' }
MTLiteralIntegersDecreaseOperator >> nodeSelectionPredicate [

	^ [ :aNode | aNode isLiteralNode & aNode isLiteralArray not and: [ aNode value isInteger ]  ]
]
