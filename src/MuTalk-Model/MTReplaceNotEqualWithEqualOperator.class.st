Class {
	#name : 'MTReplaceNotEqualWithEqualOperator',
	#superclass : 'MTSelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'accessing' }
MTReplaceNotEqualWithEqualOperator >> newSelector [
	^#=
]

{ #category : 'accessing' }
MTReplaceNotEqualWithEqualOperator >> oldSelector [
	^#~=
]
