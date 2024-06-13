Class {
	#name : 'MTReplaceAndWithNandMutantOperator',
	#superclass : 'MTSelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators - Logical boolean operation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Logical boolean operation'
}

{ #category : 'applying' }
MTReplaceAndWithNandMutantOperator >> expressionToReplace [
	^ '``@object and: ``@aBlock'
]

{ #category : 'accessing' }
MTReplaceAndWithNandMutantOperator >> newSelector [
	^#nand:
]

{ #category : 'accessing' }
MTReplaceAndWithNandMutantOperator >> oldSelector [
	^#and:
]
