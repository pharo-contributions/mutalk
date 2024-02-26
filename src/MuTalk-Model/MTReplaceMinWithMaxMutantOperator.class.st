Class {
	#name : #MTReplaceMinWithMaxMutantOperator,
	#superclass : #MTSelectorReplacementMutantOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #accessing }
MTReplaceMinWithMaxMutantOperator >> newSelector [
	^#max:
]

{ #category : #accessing }
MTReplaceMinWithMaxMutantOperator >> oldSelector [
	^#min:
]
