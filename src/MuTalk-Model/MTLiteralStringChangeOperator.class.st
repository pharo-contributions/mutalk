Class {
	#name : 'MTLiteralStringChangeOperator',
	#superclass : 'MTPredicateBasedMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'applying' }
MTLiteralStringChangeOperator >> appliesToNode: aNode [

	^ aNode isLiteralNode & aNode isLiteralArray not and: [
		  aNode value isString and: [ aNode value ~= self stringReplaced ] ]
]

{ #category : 'printing' }
MTLiteralStringChangeOperator >> description [

	^ 'Convert a literal string to a predefined string'
]

{ #category : 'applying' }
MTLiteralStringChangeOperator >> newExpression [

	^ [ :anOldNode | RBLiteralValueNode value: self stringReplaced  ]
]

{ #category : 'applying' }
MTLiteralStringChangeOperator >> stringReplaced [
	^ 'rAnDoM-MuTalk-StRiNg'
]
