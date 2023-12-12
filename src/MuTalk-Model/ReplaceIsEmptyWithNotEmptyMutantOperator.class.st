Class {
	#name : 'ReplaceIsEmptyWithNotEmptyMutantOperator',
	#superclass : 'SelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'accessing' }
ReplaceIsEmptyWithNotEmptyMutantOperator >> newSelector [
	^#notEmpty
]

{ #category : 'accessing' }
ReplaceIsEmptyWithNotEmptyMutantOperator >> oldSelector [
	^#isEmpty
]
