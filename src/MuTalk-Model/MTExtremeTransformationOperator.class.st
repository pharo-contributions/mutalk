Class {
	#name : 'MTExtremeTransformationOperator',
	#superclass : 'MTBlockBasedMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'accessing' }
MTExtremeTransformationOperator >> description [

	^ 'Removing all lines in a method'
]

{ #category : 'applying' }
MTExtremeTransformationOperator >> expressionToReplace [

	^ [ :aNode | 
	  aNode isSequence and: [ aNode parent isMethod] ]
]

{ #category : 'instance creation' }
MTExtremeTransformationOperator >> newExpression [

	^ [ :anOldNode | RBSequenceNode statements: #() ]
]
