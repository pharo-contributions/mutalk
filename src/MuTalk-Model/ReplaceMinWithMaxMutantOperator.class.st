Class {
	#name : 'ReplaceMinWithMaxMutantOperator',
	#superclass : 'SelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'accessing' }
ReplaceMinWithMaxMutantOperator >> newSelector [
	^#max:
]

{ #category : 'accessing' }
ReplaceMinWithMaxMutantOperator >> oldSelector [
	^#min:
]
