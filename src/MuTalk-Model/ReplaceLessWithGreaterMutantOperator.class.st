Class {
	#name : #ReplaceLessWithGreaterMutantOperator,
	#superclass : #SelectorReplacementMutantOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #accessing }
ReplaceLessWithGreaterMutantOperator >> newSelector [
	^#>
]

{ #category : #accessing }
ReplaceLessWithGreaterMutantOperator >> oldSelector [
	^#<
]
