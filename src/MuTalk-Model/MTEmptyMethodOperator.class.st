Class {
	#name : 'MTEmptyMethodOperator',
	#superclass : 'MTPredicateBasedMutantOperator',
	#category : 'MuTalk-Model-Operators - Deletion',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Deletion'
}

{ #category : 'applying' }
MTEmptyMethodOperator >> appliesToNode: aNode [

	^ aNode isSequence and: [ aNode parent isMethod ]
]

{ #category : 'printing' }
MTEmptyMethodOperator >> description [

	^ 'Removing all lines in a method'
]

{ #category : 'applying' }
MTEmptyMethodOperator >> newNodeFrom: anOldNode [

	^ RBSequenceNode statements: #(  )
]
