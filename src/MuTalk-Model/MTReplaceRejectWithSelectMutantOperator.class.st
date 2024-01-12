Class {
	#name : 'MTReplaceRejectWithSelectMutantOperator',
	#superclass : 'MTSelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'accessing' }
MTReplaceRejectWithSelectMutantOperator >> newSelector [
	^#select:
]

{ #category : 'accessing' }
MTReplaceRejectWithSelectMutantOperator >> oldSelector [
	^#reject:
]
