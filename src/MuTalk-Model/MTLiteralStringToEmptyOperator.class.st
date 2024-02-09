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
MTLiteralStringToEmptyOperator >> newExpression [

	^ [ :anOldNode | RBLiteralValueNode value: '' ]
]

{ #category : 'applying' }
MTLiteralStringToEmptyOperator >> nodeSelectionPredicate [

	^ [ :aNode | 
	  aNode isLiteralNode & aNode isLiteralArray not and: [ 
		  aNode value isString  and: [aNode value isNotEmpty ]  ] ]
]
