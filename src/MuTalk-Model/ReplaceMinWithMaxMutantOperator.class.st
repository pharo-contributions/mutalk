Class {
	#name : #ReplaceMinWithMaxMutantOperator,
	#superclass : #SelectorReplacementMutantOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #accessing }
ReplaceMinWithMaxMutantOperator >> newSelector [
	^#max:
]

{ #category : #accessing }
ReplaceMinWithMaxMutantOperator >> oldSelector [
	^#min:
]
