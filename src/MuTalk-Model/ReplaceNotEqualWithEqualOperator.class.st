Class {
	#name : 'ReplaceNotEqualWithEqualOperator',
	#superclass : 'SelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'accessing' }
ReplaceNotEqualWithEqualOperator >> newSelector [
	^#=
]

{ #category : 'accessing' }
ReplaceNotEqualWithEqualOperator >> oldSelector [
	^#~=
]
