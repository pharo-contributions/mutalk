Class {
	#name : 'LiteralStringChangeOperator',
	#superclass : 'BlockBasedMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'printing' }
LiteralStringChangeOperator >> description [

	^ 'Convert a literal string to a predefined string'
]

{ #category : 'applying' }
LiteralStringChangeOperator >> expressionToReplace [

	^ [ :aNode | 
	  aNode isLiteralNode & aNode isLiteralArray not and: [ 
		  aNode value isString and: [ aNode value ~= self stringReplaced ] ] ]
]

{ #category : 'applying' }
LiteralStringChangeOperator >> newExpression [

	^ [ :anOldNode | RBLiteralValueNode value: self stringReplaced  ]
]

{ #category : 'applying' }
LiteralStringChangeOperator >> stringReplaced [
	^ 'rAnDoM-MuTalk-StRiNg'
]
