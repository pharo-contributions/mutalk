Class {
	#name : 'ReplaceRejectWithSelectMutantOperator',
	#superclass : 'SelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'accessing' }
ReplaceRejectWithSelectMutantOperator >> newSelector [
	^#select:
]

{ #category : 'accessing' }
ReplaceRejectWithSelectMutantOperator >> oldSelector [
	^#reject:
]
