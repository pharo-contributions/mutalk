Class {
	#name : 'MTBlockBasedMutantOperator',
	#superclass : 'MTAbstractMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'testing' }
MTBlockBasedMutantOperator class >> isAbstract [

	^ self == MTBlockBasedMutantOperator
]

{ #category : 'testing' }
MTBlockBasedMutantOperator class >> isOriginalOperator [
	^ false
]

{ #category : 'private' }
MTBlockBasedMutantOperator >> modifiedSourceFor: aCompiledMethod with: aParseTree number: aNumber newExpression: anExpression [

	| parser allNodes |
	parser := aParseTree copy.
	allNodes := parser allChildren select: self expressionToReplace.
	allNodes size >= aNumber ifTrue: [
		| oldNode newNode |
		oldNode := allNodes at: aNumber.
		newNode := anExpression value: oldNode.
		oldNode replaceWith: newNode ].
	^ parser formattedCode
]

{ #category : 'private' }
MTBlockBasedMutantOperator >> timesToApplyIn: aCompiledMethod with: aParseTree [

	"Evaluates how many times can the operator be applyied"

	^ (aParseTree allChildren select: self expressionToReplace) size
]
