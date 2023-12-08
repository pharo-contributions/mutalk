Class {
	#name : 'ReplaceMultiplicationWithDivisionMutantOperator',
	#superclass : 'SelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'accessing' }
ReplaceMultiplicationWithDivisionMutantOperator >> newSelector [
	^#/
]

{ #category : 'accessing' }
ReplaceMultiplicationWithDivisionMutantOperator >> oldSelector [
	^#*
]
