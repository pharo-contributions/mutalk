Class {
	#name : 'MTReplaceMultiplicationWithDivisionMutantOperator',
	#superclass : 'MTSelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators - Arithmetic replacement',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Arithmetic replacement'
}

{ #category : 'accessing' }
MTReplaceMultiplicationWithDivisionMutantOperator >> newSelector [
	^#/
]

{ #category : 'accessing' }
MTReplaceMultiplicationWithDivisionMutantOperator >> oldSelector [
	^#*
]
