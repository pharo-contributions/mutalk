Class {
	#name : #MTReplaceIfFalseWithIfTrueMutantOperator,
	#superclass : #MTSelectorReplacementMutantOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #accessing }
MTReplaceIfFalseWithIfTrueMutantOperator >> newSelector [
	^#ifTrue:
]

{ #category : #accessing }
MTReplaceIfFalseWithIfTrueMutantOperator >> oldSelector [
	^#ifFalse:
]
