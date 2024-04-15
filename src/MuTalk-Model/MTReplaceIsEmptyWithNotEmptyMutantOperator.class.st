Class {
	#name : 'MTReplaceIsEmptyWithNotEmptyMutantOperator',
	#superclass : 'MTSelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators - Collection operation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Collection operation'
}

{ #category : 'accessing' }
MTReplaceIsEmptyWithNotEmptyMutantOperator >> newSelector [
	^#notEmpty
]

{ #category : 'accessing' }
MTReplaceIsEmptyWithNotEmptyMutantOperator >> oldSelector [
	^#isEmpty
]
