Class {
	#name : #ReplaceMultiplicationWithDivisionMutantOperator,
	#superclass : #SelectorReplacementMutantOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #accessing }
ReplaceMultiplicationWithDivisionMutantOperator >> newSelector [
	^#/
]

{ #category : #accessing }
ReplaceMultiplicationWithDivisionMutantOperator >> oldSelector [
	^#*
]
