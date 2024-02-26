Class {
	#name : #MTReplaceIsEmptyWithNotEmptyMutantOperator,
	#superclass : #MTSelectorReplacementMutantOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #accessing }
MTReplaceIsEmptyWithNotEmptyMutantOperator >> newSelector [
	^#notEmpty
]

{ #category : #accessing }
MTReplaceIsEmptyWithNotEmptyMutantOperator >> oldSelector [
	^#isEmpty
]
