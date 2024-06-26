Class {
	#name : 'MTReplaceRejectBlockWithAlwaysFalseBlockOperator',
	#superclass : 'MTParseRewriterMutantOperator',
	#category : 'MuTalk-Model-Operators - Collection operation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Collection operation'
}

{ #category : 'printing' }
MTReplaceRejectBlockWithAlwaysFalseBlockOperator >> description [
	^'Replace Reject block with [:each | false]'.
]

{ #category : 'applying' }
MTReplaceRejectBlockWithAlwaysFalseBlockOperator >> expressionToReplace [ 
	^'``@collection reject: ``@aBlock'
]

{ #category : 'applying' }
MTReplaceRejectBlockWithAlwaysFalseBlockOperator >> newExpression [
	^'``@collection reject: [:each | false]'
]
