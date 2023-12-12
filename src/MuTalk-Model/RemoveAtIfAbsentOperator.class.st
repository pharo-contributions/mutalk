Class {
	#name : 'RemoveAtIfAbsentOperator',
	#superclass : 'MutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'printing' }
RemoveAtIfAbsentOperator >> description [
	^'Remove at:ifAbsent:'
]

{ #category : 'applying' }
RemoveAtIfAbsentOperator >> expressionToReplace [
	^ '``@object at: ``@aBlock ifAbsent: ``@anotherBlock'
]

{ #category : 'applying' }
RemoveAtIfAbsentOperator >> newExpression [
	^ '``@anotherBlock value'
]
