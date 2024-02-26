Class {
	#name : #MTReplaceIfTrueWithIfFalseMutantOperator,
	#superclass : #MTSelectorReplacementMutantOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #accessing }
MTReplaceIfTrueWithIfFalseMutantOperator >> newSelector [
	^#ifFalse:
]

{ #category : #accessing }
MTReplaceIfTrueWithIfFalseMutantOperator >> oldSelector [
	^#ifTrue:
]
