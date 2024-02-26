Class {
	#name : #MTReplaceRejectBlockWithAlwaysTrueBlockOperator,
	#superclass : #MTParseRewriterMutantOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #printing }
MTReplaceRejectBlockWithAlwaysTrueBlockOperator >> description [
	^'Replace Reject block with [:each | true]'.
]

{ #category : #applying }
MTReplaceRejectBlockWithAlwaysTrueBlockOperator >> expressionToReplace [ 
	^'``@collection reject: ``@aBlock'
]

{ #category : #applying }
MTReplaceRejectBlockWithAlwaysTrueBlockOperator >> newExpression [
	^'``@collection reject: [:each | true]'
]
