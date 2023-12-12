Class {
	#name : 'ReplaceRejectBlockWithAlwaysFalseBlockOperator',
	#superclass : 'MutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'printing' }
ReplaceRejectBlockWithAlwaysFalseBlockOperator >> description [
	^'Replace Reject block with [:each | false]'.
]

{ #category : 'applying' }
ReplaceRejectBlockWithAlwaysFalseBlockOperator >> expressionToReplace [ 
	^'``@collection reject: ``@aBlock'
]

{ #category : 'applying' }
ReplaceRejectBlockWithAlwaysFalseBlockOperator >> newExpression [
	^'``@collection reject: [:each | false]'
]
