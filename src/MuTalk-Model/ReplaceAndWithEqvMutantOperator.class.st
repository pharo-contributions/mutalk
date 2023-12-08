Class {
	#name : 'ReplaceAndWithEqvMutantOperator',
	#superclass : 'SelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'accessing' }
ReplaceAndWithEqvMutantOperator >> newSelector [
	^#bEqv:
]

{ #category : 'accessing' }
ReplaceAndWithEqvMutantOperator >> oldSelector [
	^#and:
]

{ #category : 'suggestions' }
ReplaceAndWithEqvMutantOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [ 
	^ aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceAndWithEqvMutantOperator: aMutation
]
