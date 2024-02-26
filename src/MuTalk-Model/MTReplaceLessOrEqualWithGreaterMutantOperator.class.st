Class {
	#name : #MTReplaceLessOrEqualWithGreaterMutantOperator,
	#superclass : #MTSelectorReplacementMutantOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #accessing }
MTReplaceLessOrEqualWithGreaterMutantOperator >> newSelector [
	^#>
]

{ #category : #accessing }
MTReplaceLessOrEqualWithGreaterMutantOperator >> oldSelector [
	^#<=
]
