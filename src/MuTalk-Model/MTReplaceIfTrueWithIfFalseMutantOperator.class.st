Class {
	#name : 'MTReplaceIfTrueWithIfFalseMutantOperator',
	#superclass : 'MTSelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators - Conditional boolean operation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Conditional boolean operation'
}

{ #category : 'accessing' }
MTReplaceIfTrueWithIfFalseMutantOperator >> newSelector [
	^#ifFalse:
]

{ #category : 'accessing' }
MTReplaceIfTrueWithIfFalseMutantOperator >> oldSelector [
	^#ifTrue:
]
