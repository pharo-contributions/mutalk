Class {
	#name : 'ReplaceLessWithGreaterMutantOperator',
	#superclass : 'SelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'accessing' }
ReplaceLessWithGreaterMutantOperator >> newSelector [
	^#>
]

{ #category : 'accessing' }
ReplaceLessWithGreaterMutantOperator >> oldSelector [
	^#<
]
