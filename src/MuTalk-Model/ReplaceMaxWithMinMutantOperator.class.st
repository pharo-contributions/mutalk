Class {
	#name : #ReplaceMaxWithMinMutantOperator,
	#superclass : #SelectorReplacementMutantOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #accessing }
ReplaceMaxWithMinMutantOperator >> newSelector [
	^#min:
]

{ #category : #accessing }
ReplaceMaxWithMinMutantOperator >> oldSelector [
	^#max:
]
