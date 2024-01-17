Class {
	#name : 'MTRemoveNotOperator',
	#superclass : 'MutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
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
