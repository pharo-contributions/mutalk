Class {
	#name : 'MTReplaceGreaterOrEqualWithGreaterMutantOperator',
	#superclass : 'MTSelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators - Relational operation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Relational operation'
}

{ #category : 'accessing' }
MTReplaceGreaterOrEqualWithGreaterMutantOperator >> newSelector [
	^#>
]

{ #category : 'accessing' }
MTReplaceGreaterOrEqualWithGreaterMutantOperator >> oldSelector [
	^#>=
]

{ #category : 'suggestions' }
MTReplaceGreaterOrEqualWithGreaterMutantOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [ 
	^ aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceGreaterOrEqualWithGreaterMutantOperator: aMutation
]
