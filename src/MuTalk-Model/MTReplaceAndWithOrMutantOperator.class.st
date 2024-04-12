Class {
	#name : 'MTReplaceAndWithOrMutantOperator',
	#superclass : 'MTSelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators - Logical boolean operation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Logical boolean operation'
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
