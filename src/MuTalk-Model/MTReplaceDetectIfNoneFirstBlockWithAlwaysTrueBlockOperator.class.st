Class {
	#name : 'MTReplaceDetectIfNoneFirstBlockWithAlwaysTrueBlockOperator',
	#superclass : 'MTMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
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
