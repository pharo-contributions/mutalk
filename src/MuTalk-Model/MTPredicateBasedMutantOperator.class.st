Class {
	#name : 'MTPredicateBasedMutantOperator',
	#superclass : 'MTAbstractMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'testing' }
MTPredicateBasedMutantOperator class >> isAbstract [

	^ self == MTPredicateBasedMutantOperator
]

{ #category : 'testing' }
MTPredicateBasedMutantOperator class >> isOriginalOperator [
	^ false
]

{ #category : 'private' }
MTPredicateBasedMutantOperator >> affectedNodeFor: aParseTree at: nodeIndex [

	| allNodes |
	allNodes := self affectedNodesFor: aParseTree.
	^ allNodes at: nodeIndex
]

{ #category : 'private' }
MTPredicateBasedMutantOperator >> affectedNodesFor: aParseTree [

	^ aParseTree allChildren select: self nodeSelectionPredicate
]

{ #category : 'instance creation' }
MTPredicateBasedMutantOperator >> appliesToNode: aNode [

	self subclassResponsibility
]

{ #category : 'private' }
MTPredicateBasedMutantOperator >> modifiedSourceFor: aCompiledMethod with: aParseTree number: aNumber newExpression: anExpression [

	| parseTreeCopy allNodes |
	parseTreeCopy := aParseTree copy.
	allNodes := self affectedNodesFor: parseTreeCopy.
	allNodes size >= aNumber ifTrue: [
		| oldNode newNode |
		oldNode := allNodes at: aNumber.
		newNode := anExpression value: oldNode.
		oldNode replaceWith: newNode ].
	^ parseTreeCopy formattedCode
]

{ #category : 'instance creation' }
MTPredicateBasedMutantOperator >> newExpression [

	self subclassResponsibility
]

{ #category : 'applying' }
MTPredicateBasedMutantOperator >> nodeSelectionPredicate [

	^ [ :aNode | self appliesToNode: aNode ]
]

{ #category : 'private' }
MTPredicateBasedMutantOperator >> timesToApplyIn: aCompiledMethod with: aParseTree [
	"Evaluates how many times can the operator be applyied"

	^ (self affectedNodesFor: aParseTree) size
]
