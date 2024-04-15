Class {
	#name : 'MTReplaceOrWithXorMutantOperator',
	#superclass : 'MTSelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators - Logical boolean operation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Logical boolean operation'
}

{ #category : 'accessing' }
MTReplaceOrWithXorMutantOperator >> newSelector [
	^#bXor:
]

{ #category : 'accessing' }
MTReplaceOrWithXorMutantOperator >> oldSelector [
	^#or:
]

{ #category : 'suggestions' }
MTReplaceOrWithXorMutantOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [ 
	^ aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceOrWithXorMutantOperator: aMutation
]
