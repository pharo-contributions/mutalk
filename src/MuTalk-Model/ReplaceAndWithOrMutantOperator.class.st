Class {
	#name : 'ReplaceAndWithOrMutantOperator',
	#superclass : 'SelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'accessing' }
ReplaceAndWithOrMutantOperator >> newSelector [
	^#or:
]

{ #category : 'accessing' }
ReplaceAndWithOrMutantOperator >> oldSelector [
	^#and:
]

{ #category : 'suggestions' }
ReplaceAndWithOrMutantOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [ 
	^ aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceAndWithOrMutantOperator: aMutation
]
