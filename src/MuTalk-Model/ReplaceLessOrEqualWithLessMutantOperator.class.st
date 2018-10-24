Class {
	#name : #ReplaceLessOrEqualWithLessMutantOperator,
	#superclass : #SelectorReplacementMutantOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #accessing }
ReplaceLessOrEqualWithLessMutantOperator >> newSelector [
	^#<
]

{ #category : #accessing }
ReplaceLessOrEqualWithLessMutantOperator >> oldSelector [
	^#<=
]

{ #category : #suggestions }
ReplaceLessOrEqualWithLessMutantOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [ 
	^ aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceLessOrEqualWithLessMutantOperator: aMutation
]
