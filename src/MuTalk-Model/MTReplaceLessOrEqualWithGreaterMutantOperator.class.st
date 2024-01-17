Class {
	#name : 'MTReplaceLessOrEqualWithGreaterMutantOperator',
	#superclass : 'MTSelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'accessing' }
MTReplaceLessOrEqualWithGreaterMutantOperator >> newSelector [
	^#>
]

{ #category : 'accessing' }
MTReplaceLessOrEqualWithGreaterMutantOperator >> oldSelector [
	^#<=
]
