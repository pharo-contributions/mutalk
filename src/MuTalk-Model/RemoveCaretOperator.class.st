Class {
	#name : 'RemoveCaretOperator',
	#superclass : 'MutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'printing' }
RemoveCaretOperator >> description [
	^'Remove ^'
]

{ #category : 'applying' }
RemoveCaretOperator >> expressionToReplace [ 
	^'^``@object'

]

{ #category : 'applying' }
RemoveCaretOperator >> newExpression [ 
	^'``@object'

]

{ #category : 'suggestions' }
RemoveCaretOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [
	^aMutantKillingSuggestionGenerator suggestionForMutationProducedByARemoveCaretOperator: aMutation.
]

{ #category : 'applying' }
RemoveCaretOperator >> timesToApplyIn: aCompiledMethod with: aParseTree [ 

	"ignore methods that contain only ^self"
	(aParseTree statements asArray = { RBParseTreeSearcher treeMatching: '^ self' in: aParseTree })
		ifTrue: [ ^ 0 ].
	
	^ super timesToApplyIn: aCompiledMethod with: aParseTree 
]
