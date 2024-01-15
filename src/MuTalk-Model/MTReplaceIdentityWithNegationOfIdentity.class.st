Class {
	#name : 'MTReplaceIdentityWithNegationOfIdentity',
	#superclass : 'MutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'printing' }
MTReplaceIdentityWithNegationOfIdentity >> description [
	^'Replace a == b with (a == b) not'
]

{ #category : 'applying' }
MTReplaceIdentityWithNegationOfIdentity >> expressionToReplace [ 
	^'``@a == ``@b'

]

{ #category : 'applying' }
MTReplaceIdentityWithNegationOfIdentity >> newExpression [ 
	^'(``@a == ``@b) not'

]
