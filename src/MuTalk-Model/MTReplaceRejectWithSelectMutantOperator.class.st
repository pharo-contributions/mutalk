Class {
	#name : 'MTReplaceRejectWithSelectMutantOperator',
	#superclass : 'MTSelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators - Collection operation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Collection operation'
}

{ #category : 'accessing' }
MTReplaceRejectWithSelectMutantOperator >> newSelector [
	^#select:
]

{ #category : 'accessing' }
MTReplaceRejectWithSelectMutantOperator >> oldSelector [
	^#reject:
]
