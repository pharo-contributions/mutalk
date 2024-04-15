Class {
	#name : 'MTReplaceDetectIfNoneFirstBlockWithAlwaysFalseBlockOperator',
	#superclass : 'MTParseRewriterMutantOperator',
	#category : 'MuTalk-Model-Operators - Collection operation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Collection operation'
}

{ #category : 'printing' }
MTReplaceDetectIfNoneFirstBlockWithAlwaysFalseBlockOperator >> description [
	^'Replace detect: block with [:each | false] when #detect:ifNone: '
]

{ #category : 'applying' }
MTReplaceDetectIfNoneFirstBlockWithAlwaysFalseBlockOperator >> expressionToReplace [ 
	^'``@object detect: ``@aBlock ifNone: ``@anotherBlock'

]

{ #category : 'applying' }
MTReplaceDetectIfNoneFirstBlockWithAlwaysFalseBlockOperator >> newExpression [ 
	^'``@object detect: [:each | false] ifNone: ``@anotherBlock'

]
