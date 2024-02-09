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
MTLiteralIntegersIncreaseOperator >> newExpression [

	^ [ :anOldNode | RBLiteralValueNode value: anOldNode value + 1 ]
]

{ #category : 'applying' }
MTLiteralIntegersIncreaseOperator >> nodeSelectionPredicate [

	^ [ :aNode | aNode isLiteralNode & aNode isLiteralArray not and: [ aNode value isInteger ]  ]
]
