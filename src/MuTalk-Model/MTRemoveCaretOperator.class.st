Class {
	#name : 'MTRemoveCaretOperator',
	#superclass : 'MTParseRewriterMutantOperator',
	#category : 'MuTalk-Model-Operators - Deletion',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Deletion'
}

{ #category : 'printing' }
MTRemoveCaretOperator >> description [
	^'Remove ^'
]

{ #category : 'applying' }
MTRemoveCaretOperator >> expressionToReplace [ 
	^'^``@object'

]

{ #category : 'applying' }
MTRemoveCaretOperator >> newExpression [ 
	^'``@object'

]

{ #category : 'suggestions' }
MTRemoveCaretOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [
	^aMutantKillingSuggestionGenerator suggestionForMutationProducedByARemoveCaretOperator: aMutation.
]

{ #category : 'applying' }
MTRemoveCaretOperator >> timesToApplyIn: aCompiledMethod with: aParseTree [ 

	"ignore methods that contain only ^self"
	(aParseTree statements asArray = { RBParseTreeSearcher treeMatching: '^ self' in: aParseTree })
		ifTrue: [ ^ 0 ].
	
	^ super timesToApplyIn: aCompiledMethod with: aParseTree 
]
