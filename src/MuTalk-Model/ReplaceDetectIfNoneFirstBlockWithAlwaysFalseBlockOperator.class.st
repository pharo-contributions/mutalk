Class {
	#name : 'ReplaceDetectIfNoneFirstBlockWithAlwaysFalseBlockOperator',
	#superclass : 'MutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'printing' }
ReplaceDetectIfNoneFirstBlockWithAlwaysFalseBlockOperator >> description [
	^'Replace detect: block with [:each | false] when #detect:ifNone: '
]

{ #category : 'applying' }
ReplaceDetectIfNoneFirstBlockWithAlwaysFalseBlockOperator >> expressionToReplace [ 
	^'``@object detect: ``@aBlock ifNone: ``@anotherBlock'

]

{ #category : 'applying' }
ReplaceDetectIfNoneFirstBlockWithAlwaysFalseBlockOperator >> newExpression [ 
	^'``@object detect: [:each | false] ifNone: ``@anotherBlock'

]
