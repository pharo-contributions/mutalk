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
MTBlockBasedMutantOperator >> affectedNodeFor: aParseTree at: nodeIndex [

	| allNodes |
	allNodes := aParseTree allChildren select: self nodeSelectionPredicate.
	^ allNodes at: nodeIndex
]

{ #category : 'private' }
MTBlockBasedMutantOperator >> modifiedSourceFor: aCompiledMethod with: aParseTree number: aNumber newExpression: anExpression [

	| parseTree allNodes |
	parseTree := aParseTree copy.
	allNodes := parseTree allChildren select: self nodeSelectionPredicate.
	allNodes size >= aNumber ifTrue: [
		| oldNode newNode |
		oldNode := allNodes at: aNumber.
		newNode := anExpression value: oldNode.
		oldNode replaceWith: newNode ].
	^ parseTree formattedCode
]

{ #category : 'applying' }
MTBlockBasedMutantOperator >> nodeSelectionPredicate [

	self subclassResponsibility
]

{ #category : 'private' }
MTBlockBasedMutantOperator >> timesToApplyIn: aCompiledMethod with: aParseTree [

	"Evaluates how many times can the operator be applyied"

	^ (aParseTree allChildren select: self nodeSelectionPredicate) size
]
