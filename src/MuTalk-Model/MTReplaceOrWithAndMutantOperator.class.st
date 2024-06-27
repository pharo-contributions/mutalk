Class {
	#name : 'MTReplaceOrWithAndMutantOperator',
	#superclass : 'MTSelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators - Logical boolean operation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Logical boolean operation'
}

{ #category : 'applying' }
MTReplaceOrWithAndMutantOperator >> expressionToReplace [
	^ '``@object or: ``@aBlock'
]

{ #category : 'applying' }
MTReplaceOrWithAndMutantOperator >> newExpression [
	^ '``@object and: ``@aBlock'
]

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
