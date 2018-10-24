Class {
	#name : #RemoveInjectIntoOperator,
	#superclass : #MutantOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #printing }
RemoveInjectIntoOperator >> description [
	^'Replace inject:aValue into:aBlock with aValue'.
]

{ #category : #applying }
RemoveInjectIntoOperator >> expressionToReplace [ 
	^'``@aCollection inject: ``@aValue into:``@aBlock'
]

{ #category : #applying }
RemoveInjectIntoOperator >> newExpression [
	^'``@aValue'
]
