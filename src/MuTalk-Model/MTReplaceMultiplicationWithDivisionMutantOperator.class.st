Class {
	#name : #MTReplaceMultiplicationWithDivisionMutantOperator,
	#superclass : #MTSelectorReplacementMutantOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #accessing }
MTReplaceMultiplicationWithDivisionMutantOperator >> newSelector [
	^#/
]

{ #category : #accessing }
MTReplaceMultiplicationWithDivisionMutantOperator >> oldSelector [
	^#*
]
