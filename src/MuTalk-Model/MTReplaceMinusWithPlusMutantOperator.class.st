Class {
	#name : #MTReplaceMinusWithPlusMutantOperator,
	#superclass : #MTSelectorReplacementMutantOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #accessing }
MTReplaceMinusWithPlusMutantOperator >> newSelector [
	^#+
]

{ #category : #accessing }
MTReplaceMinusWithPlusMutantOperator >> oldSelector [
	^#-
]
