Class {
	#name : 'ReplaceEqualWithNotEqualOperator',
	#superclass : 'SelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'accessing' }
ReplaceEqualWithNotEqualOperator >> newSelector [
	^#~=
]

{ #category : 'accessing' }
ReplaceEqualWithNotEqualOperator >> oldSelector [
	^#=
]
