Class {
	#name : 'MTReplaceAndWithEqvMutantOperator',
	#superclass : 'MTSelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'accessing' }
MTReplaceAndWithEqvMutantOperator >> newSelector [
	^#bEqv:
]

{ #category : 'accessing' }
MTReplaceAndWithEqvMutantOperator >> oldSelector [
	^#and:
]

{ #category : 'suggestions' }
MTReplaceAndWithEqvMutantOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [ 
	^ aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceAndWithEqvMutantOperator: aMutation
]
