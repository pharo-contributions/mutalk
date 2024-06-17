Class {
	#name : 'MTLiteralStringChangeOperator',
	#superclass : 'MTPredicateBasedMutantOperator',
	#category : 'MuTalk-Model-Operators - Literal manipulation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Literal manipulation'
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

{ #category : 'printing' }
MTLiteralStringChangeOperator >> expressionToReplace [

	^'`aString'
]

{ #category : 'printing' }
MTLiteralStringChangeOperator >> newExpression [

	^ self stringReplaced
]

{ #category : 'applying' }
MTLiteralStringChangeOperator >> newNodeFrom: anOldNode [

	^ RBLiteralValueNode value: self stringReplaced
]

{ #category : 'applying' }
MTLiteralStringChangeOperator >> stringReplaced [
	^ 'rAnDoM-MuTalk-StRiNg'
]
