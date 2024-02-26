Class {
	#name : #MTReplaceOrWithXorMutantOperator,
	#superclass : #MTSelectorReplacementMutantOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #accessing }
MTReplaceOrWithXorMutantOperator >> newSelector [
	^#bXor:
]

{ #category : #accessing }
MTReplaceOrWithXorMutantOperator >> oldSelector [
	^#or:
]

{ #category : #suggestions }
MTReplaceOrWithXorMutantOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [ 
	^ aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceOrWithXorMutantOperator: aMutation
]
