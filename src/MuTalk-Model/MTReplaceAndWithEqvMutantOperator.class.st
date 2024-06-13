Class {
	#name : 'MTReplaceAndWithEqvMutantOperator',
	#superclass : 'MTSelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators - Logical boolean operation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Logical boolean operation'
}

{ #category : 'applying' }
MTReplaceAndWithEqvMutantOperator >> expressionToReplace [
	^'``@object and: ``@aBlock'
]

{ #category : 'accessing' }
MTReplaceAndWithEqvMutantOperator >> newSelector [
	^#bEqv:
]

{ #category : 'accessing' }
MTReplaceAndWithEqvMutantOperator >> oldSelector [
	^#and:
]

{ #category : 'suggestions' }
MTReplaceAndWithEqvMutantOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [ 
	^ aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceAndWithEqvMutantOperator: aMutation
]
