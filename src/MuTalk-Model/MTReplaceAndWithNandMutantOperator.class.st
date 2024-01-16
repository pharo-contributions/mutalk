Class {
	#name : 'MTReplaceAndWithNandMutantOperator',
	#superclass : 'MTSelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'accessing' }
MTReplaceAndWithNandMutantOperator >> newSelector [
	^#nand:
]

{ #category : 'accessing' }
MTReplaceAndWithNandMutantOperator >> oldSelector [
	^#and:
]
