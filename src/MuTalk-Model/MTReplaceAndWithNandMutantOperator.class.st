Class {
	#name : #MTReplaceAndWithNandMutantOperator,
	#superclass : #MTSelectorReplacementMutantOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #accessing }
MTReplaceAndWithNandMutantOperator >> newSelector [
	^#nand:
]

{ #category : #accessing }
MTReplaceAndWithNandMutantOperator >> oldSelector [
	^#and:
]
