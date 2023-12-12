Class {
	#name : 'ReplaceIfTrueWithIfFalseMutantOperator',
	#superclass : 'SelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'accessing' }
ReplaceIfTrueWithIfFalseMutantOperator >> newSelector [
	^#ifFalse:
]

{ #category : 'accessing' }
ReplaceIfTrueWithIfFalseMutantOperator >> oldSelector [
	^#ifTrue:
]
