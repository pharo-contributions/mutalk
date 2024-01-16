Class {
	#name : 'MTReplaceGreaterOrEqualWithEqualMutantOperator',
	#superclass : 'MTSelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'accessing' }
MTReplaceGreaterOrEqualWithEqualMutantOperator >> newSelector [
	^#=
]

{ #category : 'accessing' }
MTReplaceGreaterOrEqualWithEqualMutantOperator >> oldSelector [
	^#>=
]

{ #category : 'suggestions' }
MTReplaceGreaterOrEqualWithEqualMutantOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [ 
	^ aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceGreaterOrEqualWithEqualMutantOperator: aMutation
]
