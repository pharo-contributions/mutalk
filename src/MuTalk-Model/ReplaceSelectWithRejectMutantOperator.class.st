Class {
	#name : 'ReplaceSelectWithRejectMutantOperator',
	#superclass : 'SelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'accessing' }
ReplaceSelectWithRejectMutantOperator >> newSelector [
	^#reject:
]

{ #category : 'accessing' }
ReplaceSelectWithRejectMutantOperator >> oldSelector [
	^#select:
]
