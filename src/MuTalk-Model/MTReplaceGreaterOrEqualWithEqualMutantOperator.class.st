Class {
	#name : 'MTReplaceGreaterOrEqualWithEqualMutantOperator',
	#superclass : 'MTSelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators - Relational operation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Relational operation'
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
