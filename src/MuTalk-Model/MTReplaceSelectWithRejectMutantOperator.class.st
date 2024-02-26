Class {
	#name : #MTReplaceSelectWithRejectMutantOperator,
	#superclass : #MTSelectorReplacementMutantOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #accessing }
MTReplaceSelectWithRejectMutantOperator >> newSelector [
	^#reject:
]

{ #category : #accessing }
MTReplaceSelectWithRejectMutantOperator >> oldSelector [
	^#select:
]
