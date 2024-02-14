Class {
	#name : 'MTLiteralStringToEmptyOperator',
	#superclass : 'MTPredicateBasedMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
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

{ #category : 'applying' }
MTLiteralStringToEmptyOperator >> newNodeFrom: anOldNode [

	^ RBLiteralValueNode value: ''
]
