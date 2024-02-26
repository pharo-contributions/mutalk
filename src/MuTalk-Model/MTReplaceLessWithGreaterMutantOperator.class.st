Class {
	#name : #MTReplaceLessWithGreaterMutantOperator,
	#superclass : #MTSelectorReplacementMutantOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #accessing }
MTReplaceLessWithGreaterMutantOperator >> newSelector [
	^#>
]

{ #category : #accessing }
MTReplaceLessWithGreaterMutantOperator >> oldSelector [
	^#<
]
