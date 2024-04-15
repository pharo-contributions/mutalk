Class {
	#name : 'MTReplaceLessOrEqualWithGreaterMutantOperator',
	#superclass : 'MTSelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators - Relational operation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Relational operation'
}

{ #category : 'accessing' }
MTReplaceLessOrEqualWithGreaterMutantOperator >> newSelector [
	^#>
]

{ #category : 'accessing' }
MTReplaceLessOrEqualWithGreaterMutantOperator >> oldSelector [
	^#<=
]
