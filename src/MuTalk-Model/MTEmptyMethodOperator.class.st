Class {
	#name : 'MTEmptyMethodOperator',
	#superclass : 'MTPredicateBasedMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
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
MTEmptyMethodOperator >> newExpression [

	^ [ :anOldNode | RBSequenceNode statements: #() ]
]
