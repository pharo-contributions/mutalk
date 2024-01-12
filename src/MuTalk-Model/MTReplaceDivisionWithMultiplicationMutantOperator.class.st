Class {
	#name : 'MTReplaceDivisionWithMultiplicationMutantOperator',
	#superclass : 'MTSelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'accessing' }
MTReplaceDivisionWithMultiplicationMutantOperator >> newSelector [
	^#*
]

{ #category : 'accessing' }
MTReplaceDivisionWithMultiplicationMutantOperator >> oldSelector [
	^#/
]
