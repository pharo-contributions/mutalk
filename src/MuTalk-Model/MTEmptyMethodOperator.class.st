Class {
	#name : #MTEmptyMethodOperator,
	#superclass : #MTPredicateBasedMutantOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #applying }
MTEmptyMethodOperator >> appliesToNode: aNode [

	^ aNode isSequence and: [ aNode parent isMethod ]
]

{ #category : #printing }
MTEmptyMethodOperator >> description [

	^ 'Removing all lines in a method'
]

{ #category : #applying }
MTEmptyMethodOperator >> newNodeFrom: anOldNode [

	^ RBSequenceNode statements: #(  )
]
