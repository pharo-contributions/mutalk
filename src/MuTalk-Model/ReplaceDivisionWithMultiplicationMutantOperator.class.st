Class {
	#name : 'ReplaceDivisionWithMultiplicationMutantOperator',
	#superclass : 'SelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'accessing' }
ReplaceDivisionWithMultiplicationMutantOperator >> newSelector [
	^#*
]

{ #category : 'accessing' }
ReplaceDivisionWithMultiplicationMutantOperator >> oldSelector [
	^#/
]
