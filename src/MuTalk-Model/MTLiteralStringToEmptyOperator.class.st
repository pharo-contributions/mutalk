Class {
	#name : 'MTLiteralStringToEmptyOperator',
	#superclass : 'MTPredicateBasedMutantOperator',
	#category : 'MuTalk-Model-Operators - Literal manipulation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Literal manipulation'
}

{ #category : 'applying' }
MTLiteralStringToEmptyOperator >> appliesToNode: aNode [

	^ aNode isLiteralNode & aNode isLiteralArray not and: [
		  aNode value isString and: [ aNode value isNotEmpty ] ]
]

{ #category : 'printing' }
MTLiteralStringToEmptyOperator >> description [

	^ 'Convert a literal string to empty string'
]

{ #category : 'printing' }
MTLiteralStringToEmptyOperator >> expressionToReplace [

	^'`aString'
]

{ #category : 'printing' }
MTLiteralStringToEmptyOperator >> newExpression [

	^''
]

{ #category : 'applying' }
MTLiteralStringToEmptyOperator >> newNodeFrom: anOldNode [

	^ RBLiteralValueNode value: ''
]
