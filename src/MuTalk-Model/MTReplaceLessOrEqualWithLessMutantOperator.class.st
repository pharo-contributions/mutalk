Class {
	#name : 'MTReplaceLessOrEqualWithLessMutantOperator',
	#superclass : 'MTSelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators - Relational operation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Relational operation'
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
