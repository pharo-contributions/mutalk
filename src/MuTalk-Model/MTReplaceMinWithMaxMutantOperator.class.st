Class {
	#name : 'MTReplaceMinWithMaxMutantOperator',
	#superclass : 'MTSelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators - Relational operation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Relational operation'
}

{ #category : 'accessing' }
MTReplaceMinWithMaxMutantOperator >> newSelector [
	^#max:
]

{ #category : 'accessing' }
MTReplaceMinWithMaxMutantOperator >> oldSelector [
	^#min:
]
