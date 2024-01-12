Class {
	#name : 'MTReplaceIfTrueWithIfFalseMutantOperator',
	#superclass : 'MTSelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'accessing' }
MTReplaceIfTrueWithIfFalseMutantOperator >> newSelector [
	^#ifFalse:
]

{ #category : 'accessing' }
MTReplaceIfTrueWithIfFalseMutantOperator >> oldSelector [
	^#ifTrue:
]
