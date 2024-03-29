Class {
	#name : 'MTReplaceOrWithXorMutantOperator',
	#superclass : 'MTSelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
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
