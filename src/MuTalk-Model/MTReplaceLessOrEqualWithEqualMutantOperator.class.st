Class {
	#name : 'MTReplaceLessOrEqualWithEqualMutantOperator',
	#superclass : 'MTSelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'accessing' }
MTReplaceLessOrEqualWithEqualMutantOperator >> newSelector [ 
	^#=
]

{ #category : 'accessing' }
MTReplaceLessOrEqualWithEqualMutantOperator >> oldSelector [
	^#<=
]

{ #category : 'suggestions' }
MTReplaceLessOrEqualWithEqualMutantOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [ 
	^ aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceLessOrEqualWithEqualMutantOperator: aMutation
]
