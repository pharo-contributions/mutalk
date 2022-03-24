Class {
	#name : #LiteralStringToEmptyOperator,
	#superclass : #BlockBasedMutantOperator,
	#category : #'MuTalk-Model-Operators'
}

{ #category : #printing }
LiteralStringToEmptyOperator >> description [

	^ 'Convert a literal string to empty string'
]

{ #category : #applying }
LiteralStringToEmptyOperator >> expressionToReplace [

	^ [ :aNode | 
	  aNode isLiteralNode & aNode isLiteralArray not and: [ 
		  aNode value isString  and: [aNode value isNotEmpty ]  ] ]
]

{ #category : #applying }
LiteralStringToEmptyOperator >> newExpression [

	^ [ :anOldNode | RBLiteralValueNode value: '' ]
]
