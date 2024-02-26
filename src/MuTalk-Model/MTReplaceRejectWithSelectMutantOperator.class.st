Class {
	#name : #MTReplaceRejectWithSelectMutantOperator,
	#superclass : #MTSelectorReplacementMutantOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #accessing }
MTReplaceRejectWithSelectMutantOperator >> newSelector [
	^#select:
]

{ #category : #accessing }
MTReplaceRejectWithSelectMutantOperator >> oldSelector [
	^#reject:
]
