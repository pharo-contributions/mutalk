Class {
	#name : 'MTReplaceDetectIfNoneSecondBlockWithEmptyBlockOperator',
	#superclass : 'MutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
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
