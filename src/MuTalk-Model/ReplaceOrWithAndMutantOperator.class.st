Class {
	#name : 'ReplaceOrWithAndMutantOperator',
	#superclass : 'SelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'accessing' }
ReplaceOrWithAndMutantOperator >> newSelector [
	^#and:
]

{ #category : 'accessing' }
ReplaceOrWithAndMutantOperator >> oldSelector [
	^#or:
]

{ #category : 'suggestions' }
ReplaceOrWithAndMutantOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [ 
	^ aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceOrWithAndMutantOperator: aMutation
]
