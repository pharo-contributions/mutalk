Class {
	#name : 'MTReplaceLessWithGreaterMutantOperator',
	#superclass : 'MTSelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators - Relational operation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Relational operation'
}

{ #category : 'accessing' }
MTReplaceLessWithGreaterMutantOperator >> newSelector [
	^#>
]

{ #category : 'accessing' }
MTReplaceLessWithGreaterMutantOperator >> oldSelector [
	^#<
]
