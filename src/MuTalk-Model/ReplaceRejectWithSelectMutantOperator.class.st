Class {
	#name : #ReplaceRejectWithSelectMutantOperator,
	#superclass : #SelectorReplacementMutantOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #accessing }
ReplaceRejectWithSelectMutantOperator >> newSelector [
	^#select:
]

{ #category : #accessing }
ReplaceRejectWithSelectMutantOperator >> oldSelector [
	^#reject:
]
