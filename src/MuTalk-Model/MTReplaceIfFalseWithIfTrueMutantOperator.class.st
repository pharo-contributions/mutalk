Class {
	#name : 'MTReplaceIfFalseWithIfTrueMutantOperator',
	#superclass : 'MTSelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'accessing' }
MTReplaceIfFalseWithIfTrueMutantOperator >> newSelector [
	^#ifTrue:
]

{ #category : 'accessing' }
MTReplaceIfFalseWithIfTrueMutantOperator >> oldSelector [
	^#ifFalse:
]
