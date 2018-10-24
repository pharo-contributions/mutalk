Class {
	#name : #ReplaceMinusWithPlusMutantOperator,
	#superclass : #SelectorReplacementMutantOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #accessing }
ReplaceMinusWithPlusMutantOperator >> newSelector [
	^#+
]

{ #category : #accessing }
ReplaceMinusWithPlusMutantOperator >> oldSelector [
	^#-
]
