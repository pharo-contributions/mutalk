Class {
	#name : #ReplaceSelectWithRejectMutantOperator,
	#superclass : #SelectorReplacementMutantOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #accessing }
ReplaceSelectWithRejectMutantOperator >> newSelector [
	^#reject:
]

{ #category : #accessing }
ReplaceSelectWithRejectMutantOperator >> oldSelector [
	^#select:
]
