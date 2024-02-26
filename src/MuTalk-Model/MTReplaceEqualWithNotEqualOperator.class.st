Class {
	#name : #MTReplaceEqualWithNotEqualOperator,
	#superclass : #MTSelectorReplacementMutantOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #accessing }
MTReplaceEqualWithNotEqualOperator >> newSelector [
	^#~=
]

{ #category : #accessing }
MTReplaceEqualWithNotEqualOperator >> oldSelector [
	^#=
]
