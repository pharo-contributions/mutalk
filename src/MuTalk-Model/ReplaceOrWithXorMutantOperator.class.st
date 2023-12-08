Class {
	#name : 'ReplaceOrWithXorMutantOperator',
	#superclass : 'SelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'accessing' }
ReplaceOrWithXorMutantOperator >> newSelector [
	^#bXor:
]

{ #category : 'accessing' }
ReplaceOrWithXorMutantOperator >> oldSelector [
	^#or:
]

{ #category : 'suggestions' }
ReplaceOrWithXorMutantOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [ 
	^ aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceOrWithXorMutantOperator: aMutation
]
