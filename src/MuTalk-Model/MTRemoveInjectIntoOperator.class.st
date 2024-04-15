Class {
	#name : 'MTRemoveInjectIntoOperator',
	#superclass : 'MTParseRewriterMutantOperator',
	#category : 'MuTalk-Model-Operators - Deletion',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Deletion'
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
