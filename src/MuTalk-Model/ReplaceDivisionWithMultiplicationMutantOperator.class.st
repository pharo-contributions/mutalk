Class {
	#name : #ReplaceDivisionWithMultiplicationMutantOperator,
	#superclass : #SelectorReplacementMutantOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #accessing }
ReplaceDivisionWithMultiplicationMutantOperator >> newSelector [
	^#*
]

{ #category : #accessing }
ReplaceDivisionWithMultiplicationMutantOperator >> oldSelector [
	^#/
]
