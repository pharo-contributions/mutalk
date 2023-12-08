Class {
	#name : 'ReplaceIfFalseWithIfTrueMutantOperator',
	#superclass : 'SelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'accessing' }
ReplaceIfFalseWithIfTrueMutantOperator >> newSelector [
	^#ifTrue:
]

{ #category : 'accessing' }
ReplaceIfFalseWithIfTrueMutantOperator >> oldSelector [
	^#ifFalse:
]
