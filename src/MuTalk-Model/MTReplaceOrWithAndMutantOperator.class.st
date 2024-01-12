Class {
	#name : 'MTReplaceOrWithAndMutantOperator',
	#superclass : 'MTSelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'accessing' }
MTReplaceOrWithAndMutantOperator >> newSelector [
	^#and:
]

{ #category : 'accessing' }
MTReplaceOrWithAndMutantOperator >> oldSelector [
	^#or:
]

{ #category : 'suggestions' }
MTReplaceOrWithAndMutantOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [ 
	^ aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceOrWithAndMutantOperator: aMutation
]
