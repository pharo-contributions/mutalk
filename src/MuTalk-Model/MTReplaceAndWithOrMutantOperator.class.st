Class {
	#name : 'MTReplaceAndWithOrMutantOperator',
	#superclass : 'MTSelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'accessing' }
MTReplaceAndWithOrMutantOperator >> newSelector [
	^#or:
]

{ #category : 'accessing' }
MTReplaceAndWithOrMutantOperator >> oldSelector [
	^#and:
]

{ #category : 'suggestions' }
MTReplaceAndWithOrMutantOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [ 
	^ aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceAndWithOrMutantOperator: aMutation
]
