Class {
	#name : 'ReplaceMinusWithPlusMutantOperator',
	#superclass : 'SelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'accessing' }
ReplaceMinusWithPlusMutantOperator >> newSelector [
	^#+
]

{ #category : 'accessing' }
ReplaceMinusWithPlusMutantOperator >> oldSelector [
	^#-
]
