Class {
	#name : 'MTRemoveNotOperator',
	#superclass : 'MTParseRewriterMutantOperator',
	#category : 'MuTalk-Model-Operators - Deletion',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Deletion'
}

{ #category : 'printing' }
MTRemoveNotOperator >> description [
	^'Remove #not'.
]

{ #category : 'applying' }
MTRemoveNotOperator >> expressionToReplace [ 
	^'``@aBoolean not'
]

{ #category : 'applying' }
MTRemoveNotOperator >> newExpression [
	^'``@aBoolean'
]
