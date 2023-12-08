Class {
	#name : 'ExtremeTransformationOperator',
	#superclass : 'BlockBasedMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'accessing' }
ExtremeTransformationOperator >> description [

	^ 'Removing all lines in a method'
]

{ #category : 'applying' }
ExtremeTransformationOperator >> expressionToReplace [

	^ [ :aNode | 
	  aNode isSequence and: [ aNode parent isMethod] ]
]

{ #category : 'instance creation' }
ExtremeTransformationOperator >> newExpression [

	^ [ :anOldNode | RBSequenceNode statements: #() ]
]
