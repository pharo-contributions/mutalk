Class {
	#name : #MTReplaceMaxWithMinMutantOperator,
	#superclass : #MTSelectorReplacementMutantOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #accessing }
MTReplaceMaxWithMinMutantOperator >> newSelector [
	^#min:
]

{ #category : #accessing }
MTReplaceMaxWithMinMutantOperator >> oldSelector [
	^#max:
]
