Class {
	#name : #MTReplaceDivisionWithMultiplicationMutantOperator,
	#superclass : #MTSelectorReplacementMutantOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #accessing }
MTReplaceDivisionWithMultiplicationMutantOperator >> newSelector [
	^#*
]

{ #category : #accessing }
MTReplaceDivisionWithMultiplicationMutantOperator >> oldSelector [
	^#/
]
