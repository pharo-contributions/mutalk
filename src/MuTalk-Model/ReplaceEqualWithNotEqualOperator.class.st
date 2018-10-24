Class {
	#name : #ReplaceEqualWithNotEqualOperator,
	#superclass : #SelectorReplacementMutantOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #accessing }
ReplaceEqualWithNotEqualOperator >> newSelector [
	^#~=
]

{ #category : #accessing }
ReplaceEqualWithNotEqualOperator >> oldSelector [
	^#=
]
