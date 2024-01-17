Class {
	#name : 'MTReplaceSortBlockWithAlwaysTrueBlockOperator',
	#superclass : 'MutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'printing' }
MTReplaceSortBlockWithAlwaysTrueBlockOperator >> description [
	^'Replace sortBlock:aBlock with sortBlock:[:a :b| true]'.
]

{ #category : 'applying' }
MTReplaceSortBlockWithAlwaysTrueBlockOperator >> expressionToReplace [ 
	^'``@sortedCollection sortBlock: ``@aBlock'
]

{ #category : 'applying' }
MTReplaceSortBlockWithAlwaysTrueBlockOperator >> newExpression [
	^'``@sortedCollection sortBlock: [:a :b| true]'.
]
