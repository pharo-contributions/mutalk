Class {
	#name : #ReplaceIfFalseWithIfTrueMutantOperator,
	#superclass : #SelectorReplacementMutantOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #accessing }
ReplaceIfFalseWithIfTrueMutantOperator >> newSelector [
	^#ifTrue:
]

{ #category : #accessing }
ReplaceIfFalseWithIfTrueMutantOperator >> oldSelector [
	^#ifFalse:
]
