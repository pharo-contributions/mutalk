Class {
	#name : 'MTReplaceIdentityWithNegationOfIdentity',
	#superclass : 'MTParseRewriterMutantOperator',
	#category : 'MuTalk-Model-Operators - Relational operation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Relational operation'
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
