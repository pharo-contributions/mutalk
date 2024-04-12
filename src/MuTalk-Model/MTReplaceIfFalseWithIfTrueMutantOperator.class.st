Class {
	#name : 'MTReplaceIfFalseWithIfTrueMutantOperator',
	#superclass : 'MTSelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators - Conditional boolean operation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Conditional boolean operation'
}

{ #category : 'accessing' }
MTReplaceIfFalseWithIfTrueMutantOperator >> newSelector [
	^#ifTrue:
]

{ #category : 'accessing' }
MTReplaceIfFalseWithIfTrueMutantOperator >> oldSelector [
	^#ifFalse:
]
