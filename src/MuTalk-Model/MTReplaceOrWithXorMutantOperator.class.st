Class {
	#name : 'MTReplaceOrWithXorMutantOperator',
	#superclass : 'MTSelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators - Logical boolean operation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Logical boolean operation'
}

{ #category : 'applying' }
MTReplaceOrWithXorMutantOperator >> expressionToReplace [
	^ '``@object or: ``@aBlock'
]

{ #category : 'applying' }
MTReplaceOrWithXorMutantOperator >> newExpression [
	^ '``@object bXor: ``@aBlock'
]

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
