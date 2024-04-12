Class {
	#name : 'MTReplaceMaxWithMinMutantOperator',
	#superclass : 'MTSelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators - Relational operation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Relational operation'
}

{ #category : 'accessing' }
MTReplaceMaxWithMinMutantOperator >> newSelector [
	^#min:
]

{ #category : 'accessing' }
MTReplaceMaxWithMinMutantOperator >> oldSelector [
	^#max:
]
