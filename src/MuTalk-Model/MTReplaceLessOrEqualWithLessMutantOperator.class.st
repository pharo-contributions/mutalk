Class {
	#name : 'MTReplaceLessOrEqualWithLessMutantOperator',
	#superclass : 'MTSelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'accessing' }
MTReplaceLessOrEqualWithLessMutantOperator >> newSelector [
	^#<
]

{ #category : 'accessing' }
MTReplaceLessOrEqualWithLessMutantOperator >> oldSelector [
	^#<=
]

{ #category : 'suggestions' }
MTReplaceLessOrEqualWithLessMutantOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [ 
	^ aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceLessOrEqualWithLessMutantOperator: aMutation
]
