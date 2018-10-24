Class {
	#name : #RemoveNotOperator,
	#superclass : #MutantOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #printing }
RemoveNotOperator >> description [
	^'Remove #not'.
]

{ #category : #applying }
RemoveNotOperator >> expressionToReplace [ 
	^'``@aBoolean not'
]

{ #category : #applying }
RemoveNotOperator >> newExpression [
	^'``@aBoolean'
]
