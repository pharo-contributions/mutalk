Class {
	#name : 'MTRemoveInjectIntoOperator',
	#superclass : 'MutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'printing' }
MTRemoveInjectIntoOperator >> description [
	^'Replace inject:aValue into:aBlock with aValue'.
]

{ #category : 'applying' }
MTRemoveInjectIntoOperator >> expressionToReplace [ 
	^'``@aCollection inject: ``@aValue into:``@aBlock'
]

{ #category : 'applying' }
MTRemoveInjectIntoOperator >> newExpression [
	^'``@aValue'
]
