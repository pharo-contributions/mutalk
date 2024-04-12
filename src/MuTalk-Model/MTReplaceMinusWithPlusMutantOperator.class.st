Class {
	#name : 'MTReplaceMinusWithPlusMutantOperator',
	#superclass : 'MTSelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators - Arithmetic replacement',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Arithmetic replacement'
}

{ #category : 'accessing' }
MTReplaceMinusWithPlusMutantOperator >> newSelector [
	^#+
]

{ #category : 'accessing' }
MTReplaceMinusWithPlusMutantOperator >> oldSelector [
	^#-
]
