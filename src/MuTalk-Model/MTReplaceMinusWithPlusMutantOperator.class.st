Class {
	#name : 'MTReplaceMinusWithPlusMutantOperator',
	#superclass : 'MTSelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'accessing' }
MTReplaceMinusWithPlusMutantOperator >> newSelector [
	^#+
]

{ #category : 'accessing' }
MTReplaceMinusWithPlusMutantOperator >> oldSelector [
	^#-
]
