Class {
	#name : 'MTReplaceSelectWithRejectMutantOperator',
	#superclass : 'MTSelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators - Collection operation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Collection operation'
}

{ #category : 'accessing' }
MTReplaceSelectWithRejectMutantOperator >> newSelector [
	^#reject:
]

{ #category : 'accessing' }
MTReplaceSelectWithRejectMutantOperator >> oldSelector [
	^#select:
]
