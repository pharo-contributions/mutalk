Class {
	#name : 'MTReplaceSelectWithRejectMutantOperator',
	#superclass : 'MTSelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'accessing' }
MTReplaceSelectWithRejectMutantOperator >> newSelector [
	^#reject:
]

{ #category : 'accessing' }
MTReplaceSelectWithRejectMutantOperator >> oldSelector [
	^#select:
]
