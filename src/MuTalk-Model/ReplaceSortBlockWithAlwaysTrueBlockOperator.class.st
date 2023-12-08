Class {
	#name : 'ReplaceSortBlockWithAlwaysTrueBlockOperator',
	#superclass : 'MutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'printing' }
ReplaceSortBlockWithAlwaysTrueBlockOperator >> description [
	^'Replace sortBlock:aBlock with sortBlock:[:a :b| true]'.
]

{ #category : 'applying' }
ReplaceSortBlockWithAlwaysTrueBlockOperator >> expressionToReplace [ 
	^'``@sortedCollection sortBlock: ``@aBlock'
]

{ #category : 'applying' }
ReplaceSortBlockWithAlwaysTrueBlockOperator >> newExpression [
	^'``@sortedCollection sortBlock: [:a :b| true]'.
]
