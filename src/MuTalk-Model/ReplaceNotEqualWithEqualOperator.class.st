Class {
	#name : #ReplaceNotEqualWithEqualOperator,
	#superclass : #SelectorReplacementMutantOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #accessing }
ReplaceNotEqualWithEqualOperator >> newSelector [
	^#=
]

{ #category : #accessing }
ReplaceNotEqualWithEqualOperator >> oldSelector [
	^#~=
]
