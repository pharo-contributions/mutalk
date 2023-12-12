Class {
	#name : 'ReplaceAndWithNandMutantOperator',
	#superclass : 'SelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'accessing' }
ReplaceAndWithNandMutantOperator >> newSelector [
	^#nand:
]

{ #category : 'accessing' }
ReplaceAndWithNandMutantOperator >> oldSelector [
	^#and:
]
