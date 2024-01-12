Class {
	#name : 'MTReplaceMultiplicationWithDivisionMutantOperator',
	#superclass : 'MTSelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'accessing' }
MTReplaceMultiplicationWithDivisionMutantOperator >> newSelector [
	^#/
]

{ #category : 'accessing' }
MTReplaceMultiplicationWithDivisionMutantOperator >> oldSelector [
	^#*
]
