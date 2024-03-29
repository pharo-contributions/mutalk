Class {
	#name : 'MTRemoveAtIfAbsentOperator',
	#superclass : 'MTParseRewriterMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'printing' }
MTRemoveAtIfAbsentOperator >> description [
	^'Remove at:ifAbsent:'
]

{ #category : 'applying' }
MTRemoveAtIfAbsentOperator >> expressionToReplace [
	^ '``@object at: ``@aBlock ifAbsent: ``@anotherBlock'
]

{ #category : 'applying' }
MTRemoveAtIfAbsentOperator >> newExpression [
	^ '``@anotherBlock value'
]
