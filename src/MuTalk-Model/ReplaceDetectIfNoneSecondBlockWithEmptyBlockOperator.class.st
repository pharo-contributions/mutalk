Class {
	#name : #ReplaceDetectIfNoneSecondBlockWithEmptyBlockOperator,
	#superclass : #MutantOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #printing }
ReplaceDetectIfNoneSecondBlockWithEmptyBlockOperator >> description [
	^'Replace ifNone: block with [] when #detect:ifNone:'
]

{ #category : #applying }
ReplaceDetectIfNoneSecondBlockWithEmptyBlockOperator >> expressionToReplace [ 
	^'``@object detect: ``@aBlock ifNone: ``@anotherBlock'

]

{ #category : #applying }
ReplaceDetectIfNoneSecondBlockWithEmptyBlockOperator >> newExpression [ 
	^'``@object detect: ``@aBlock ifNone: []'
]
