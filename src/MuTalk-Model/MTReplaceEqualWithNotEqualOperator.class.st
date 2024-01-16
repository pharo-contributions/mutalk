Class {
	#name : 'MTReplaceEqualWithNotEqualOperator',
	#superclass : 'MTSelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'accessing' }
MTReplaceEqualWithNotEqualOperator >> newSelector [
	^#~=
]

{ #category : 'accessing' }
MTReplaceEqualWithNotEqualOperator >> oldSelector [
	^#=
]
