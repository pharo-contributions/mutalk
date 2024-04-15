Class {
	#name : 'MTReplaceDetectIfNoneFirstBlockWithAlwaysTrueBlockOperator',
	#superclass : 'MTParseRewriterMutantOperator',
	#category : 'MuTalk-Model-Operators - Collection operation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Collection operation'
}

{ #category : 'printing' }
MTReplaceDetectIfNoneFirstBlockWithAlwaysTrueBlockOperator >> description [
	^'Replace detect: block with [:each | true] when #detect:ifNone: '
]

{ #category : 'applying' }
MTReplaceDetectIfNoneFirstBlockWithAlwaysTrueBlockOperator >> expressionToReplace [ 
	^'``@object detect: ``@aBlock ifNone: ``@anotherBlock'

]

{ #category : 'applying' }
MTReplaceDetectIfNoneFirstBlockWithAlwaysTrueBlockOperator >> newExpression [ 
	^'``@object detect: [:each | true] ifNone: ``@anotherBlock'

]
