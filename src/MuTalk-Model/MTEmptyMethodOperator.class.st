Class {
	#name : 'MTEmptyMethodOperator',
	#superclass : 'MTBlockBasedMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'printing' }
MTEmptyMethodOperator >> description [

	^ 'Removing all lines in a method'
]

{ #category : 'applying' }
MTEmptyMethodOperator >> expressionToReplace [

	^ [ :aNode | 
	  aNode isSequence and: [ aNode parent isMethod] ]
]

{ #category : 'applying' }
MTEmptyMethodOperator >> newExpression [

	^ [ :anOldNode | RBSequenceNode statements: #() ]
]
