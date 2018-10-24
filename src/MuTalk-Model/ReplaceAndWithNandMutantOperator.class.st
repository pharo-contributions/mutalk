Class {
	#name : #ReplaceAndWithNandMutantOperator,
	#superclass : #SelectorReplacementMutantOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #accessing }
ReplaceAndWithNandMutantOperator >> newSelector [
	^#nand:
]

{ #category : #accessing }
ReplaceAndWithNandMutantOperator >> oldSelector [
	^#and:
]
