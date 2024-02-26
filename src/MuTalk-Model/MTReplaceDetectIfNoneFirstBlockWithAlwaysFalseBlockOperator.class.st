Class {
	#name : #MTReplaceDetectIfNoneFirstBlockWithAlwaysFalseBlockOperator,
	#superclass : #MTParseRewriterMutantOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #printing }
MTReplaceDetectIfNoneFirstBlockWithAlwaysFalseBlockOperator >> description [
	^'Replace detect: block with [:each | false] when #detect:ifNone: '
]

{ #category : #applying }
MTReplaceDetectIfNoneFirstBlockWithAlwaysFalseBlockOperator >> expressionToReplace [ 
	^'``@object detect: ``@aBlock ifNone: ``@anotherBlock'

]

{ #category : #applying }
MTReplaceDetectIfNoneFirstBlockWithAlwaysFalseBlockOperator >> newExpression [ 
	^'``@object detect: [:each | false] ifNone: ``@anotherBlock'

]
