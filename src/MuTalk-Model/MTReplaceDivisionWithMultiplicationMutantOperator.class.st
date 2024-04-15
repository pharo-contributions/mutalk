Class {
	#name : 'MTReplaceDivisionWithMultiplicationMutantOperator',
	#superclass : 'MTSelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators - Arithmetic replacement',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Arithmetic replacement'
}

{ #category : 'accessing' }
MTReplaceDivisionWithMultiplicationMutantOperator >> newSelector [
	^#*
]

{ #category : 'accessing' }
MTReplaceDivisionWithMultiplicationMutantOperator >> oldSelector [
	^#/
]
