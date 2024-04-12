Class {
	#name : 'MTReplaceDetectIfNoneSecondBlockWithEmptyBlockOperator',
	#superclass : 'MTParseRewriterMutantOperator',
	#category : 'MuTalk-Model-Operators - Collection operation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Collection operation'
}

{ #category : 'printing' }
MTReplaceDetectIfNoneSecondBlockWithEmptyBlockOperator >> description [
	^'Replace ifNone: block with [] when #detect:ifNone:'
]

{ #category : 'applying' }
MTReplaceDetectIfNoneSecondBlockWithEmptyBlockOperator >> expressionToReplace [ 
	^'``@object detect: ``@aBlock ifNone: ``@anotherBlock'

]

{ #category : 'applying' }
MTReplaceDetectIfNoneSecondBlockWithEmptyBlockOperator >> newExpression [ 
	^'``@object detect: ``@aBlock ifNone: []'
]
