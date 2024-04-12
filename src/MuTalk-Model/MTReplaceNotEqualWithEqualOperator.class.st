Class {
	#name : 'MTReplaceNotEqualWithEqualOperator',
	#superclass : 'MTSelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators - Relational operation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Relational operation'
}

{ #category : 'accessing' }
MTReplaceNotEqualWithEqualOperator >> newSelector [
	^#=
]

{ #category : 'accessing' }
MTReplaceNotEqualWithEqualOperator >> oldSelector [
	^#~=
]
