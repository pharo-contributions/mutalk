Class {
	#name : #MTReplaceGreaterOrEqualWithGreaterMutantOperator,
	#superclass : #MTSelectorReplacementMutantOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #accessing }
MTReplaceGreaterOrEqualWithGreaterMutantOperator >> newSelector [
	^#>
]

{ #category : #accessing }
MTReplaceGreaterOrEqualWithGreaterMutantOperator >> oldSelector [
	^#>=
]

{ #category : #suggestions }
MTReplaceGreaterOrEqualWithGreaterMutantOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [ 
	^ aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceGreaterOrEqualWithGreaterMutantOperator: aMutation
]
