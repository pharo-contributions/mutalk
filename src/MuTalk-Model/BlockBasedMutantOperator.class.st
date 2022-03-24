Class {
	#name : #BlockBasedMutantOperator,
	#superclass : #MutantOperator,
	#category : #'MuTalk-Model-Operators'
}

{ #category : #testing }
BlockBasedMutantOperator >> isAPosibleMutatedNode: aRBMethodNode [

	| nodeThatMatches |
	nodeThatMatches := aRBMethodNode allChildren detect:  self newExpression ifNone: [nil].
	^ nodeThatMatches notNil and: [ 
		  self is: nodeThatMatches equalTo: aRBMethodNode ]
]

{ #category : #testing }
BlockBasedMutantOperator >> isAPosibleNodeToMutate: aRBMethodNode [

	| nodeThatMatches |
	nodeThatMatches := aRBMethodNode allChildren
		                   detect: self expressionToReplace
		                   ifNone: [ nil ].

	^ nodeThatMatches notNil and: [ 
		  self is: aRBMethodNode equalTo: nodeThatMatches ]
]

{ #category : #private }
BlockBasedMutantOperator >> modifiedSourceFor: aCompiledMethod with: aParseTree number: aNumber [

	| parser allNodes |
	parser := aParseTree copy.
	allNodes := parser allChildren select: self expressionToReplace.
	allNodes size >= aNumber ifTrue: [ 
		oldNode := allNodes at: aNumber.
		newNode := self newExpression value: oldNode.
		oldNode replaceWith: newNode ].
	^ parser formattedCode
]

{ #category : #private }
BlockBasedMutantOperator >> timesToApplyIn: aCompiledMethod with: aParseTree [

	"Evaluates how many times can the operator be applyied"

	^ (aParseTree allChildren select: self expressionToReplace) size
]
