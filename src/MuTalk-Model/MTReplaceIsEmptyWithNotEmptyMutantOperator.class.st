Class {
	#name : 'MTReplaceIsEmptyWithNotEmptyMutantOperator',
	#superclass : 'MTSelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'accessing' }
MTReplaceIsEmptyWithNotEmptyMutantOperator >> newSelector [
	^#notEmpty
]

{ #category : 'accessing' }
MTReplaceIsEmptyWithNotEmptyMutantOperator >> oldSelector [
	^#isEmpty
]
