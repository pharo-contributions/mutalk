Class {
	#name : 'MTLiteralStringToEmptyOperator',
	#superclass : 'MTBlockBasedMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'printing' }
MTLiteralStringToEmptyOperator >> description [

	^ 'Convert a literal string to empty string'
]

{ #category : 'applying' }
MTLiteralStringToEmptyOperator >> expressionToReplace [

	^ [ :aNode | 
	  aNode isLiteralNode & aNode isLiteralArray not and: [ 
		  aNode value isString  and: [aNode value isNotEmpty ]  ] ]
]

{ #category : 'applying' }
MTLiteralStringToEmptyOperator >> newExpression [

	^ [ :anOldNode | RBLiteralValueNode value: '' ]
]
