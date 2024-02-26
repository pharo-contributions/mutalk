Class {
	#name : #MTReplaceNotEqualWithEqualOperator,
	#superclass : #MTSelectorReplacementMutantOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #accessing }
MTReplaceNotEqualWithEqualOperator >> newSelector [
	^#=
]

{ #category : #accessing }
MTReplaceNotEqualWithEqualOperator >> oldSelector [
	^#~=
]
