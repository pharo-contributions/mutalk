Class {
	#name : #ReplaceDetectIfNoneFirstBlockWithAlwaysTrueBlockOperator,
	#superclass : #MutantOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #printing }
ReplaceDetectIfNoneFirstBlockWithAlwaysTrueBlockOperator >> description [
	^'Replace detect: block with [:each | true] when #detect:ifNone: '
]

{ #category : #applying }
ReplaceDetectIfNoneFirstBlockWithAlwaysTrueBlockOperator >> expressionToReplace [ 
	^'``@object detect: ``@aBlock ifNone: ``@anotherBlock'

]

{ #category : #applying }
ReplaceDetectIfNoneFirstBlockWithAlwaysTrueBlockOperator >> newExpression [ 
	^'``@object detect: [:each | true] ifNone: ``@anotherBlock'

]
