Class {
	#name : #ReplaceLessOrEqualWithGreaterMutantOperator,
	#superclass : #SelectorReplacementMutantOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #accessing }
ReplaceLessOrEqualWithGreaterMutantOperator >> newSelector [
	^#>
]

{ #category : #accessing }
ReplaceLessOrEqualWithGreaterMutantOperator >> oldSelector [
	^#<=
]
