Class {
	#name : 'ReplaceLessOrEqualWithGreaterMutantOperator',
	#superclass : 'SelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'accessing' }
ReplaceLessOrEqualWithGreaterMutantOperator >> newSelector [
	^#>
]

{ #category : 'accessing' }
ReplaceLessOrEqualWithGreaterMutantOperator >> oldSelector [
	^#<=
]
