Class {
	#name : 'ReplaceIdentityWithNegationOfIdentity',
	#superclass : 'MutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'printing' }
ReplaceIdentityWithNegationOfIdentity >> description [
	^'Replace a == b with (a == b) not'
]

{ #category : 'applying' }
ReplaceIdentityWithNegationOfIdentity >> expressionToReplace [ 
	^'``@a == ``@b'

]

{ #category : 'applying' }
ReplaceIdentityWithNegationOfIdentity >> newExpression [ 
	^'(``@a == ``@b) not'

]
