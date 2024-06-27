Class {
	#name : 'MTPredicateBasedMutantOperator',
	#superclass : 'MTAbstractMutantOperator',
	#category : 'MuTalk-Model-Operators - Abstract',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Abstract'
}

{ #category : 'testing' }
MTPredicateBasedMutantOperator class >> isAbstract [

	^ self == MTPredicateBasedMutantOperator
]

{ #category : 'private' }
MTPredicateBasedMutantOperator >> affectedNodeFor: aParseTree at: nodeIndex [

	| allNodes |
	allNodes := self affectedNodesFor: aParseTree.
	^ allNodes at: nodeIndex
]

{ #category : 'private' }
MTPredicateBasedMutantOperator >> affectedNodesFor: aParseTree [

	^ aParseTree allChildren select: [ :aNode |
		  self appliesToNode: aNode ]
]

{ #category : 'instance creation' }
MTPredicateBasedMutantOperator >> appliesToNode: aNode [

	self subclassResponsibility
]

{ #category : 'private' }
MTPredicateBasedMutantOperator >> applyTo: anOldNode [

	^ self newNodeFrom: anOldNode
]

{ #category : 'private' }
MTPredicateBasedMutantOperator >> modifiedSourceFor: aCompiledMethod with: aParseTree number: aNumber newExpression: aNode [

	| parseTreeCopy allNodes |
	parseTreeCopy := aParseTree copy.
	allNodes := self affectedNodesFor: parseTreeCopy.
	allNodes size >= aNumber ifTrue: [
		| oldNode |
		oldNode := allNodes at: aNumber.
		oldNode replaceWith: aNode ].
	^ parseTreeCopy formattedCode
]

{ #category : 'private' }
MTPredicateBasedMutantOperator >> mutationsFor: aCompiledMethod with: aParseTree number: nodeIndex storeIn: accumulator [

	| affectedNode newNode |
	affectedNode := self affectedNodeFor: aParseTree at: nodeIndex.
	newNode := self newNodeFrom: affectedNode.

	accumulator add: (MTMethodMutation
			 for: aCompiledMethod
			 using: self
			 nodeNumber: nodeIndex
			 ofClass: aCompiledMethod methodClass
			 withData: newNode).
	^ accumulator
]

{ #category : 'instance creation' }
MTPredicateBasedMutantOperator >> newNodeFrom: anOldNode [

	self subclassResponsibility
]

{ #category : 'source' }
MTPredicateBasedMutantOperator >> nodeToMutateWith: aMTMethodMutation [

	^ self
		  affectedNodeFor: aMTMethodMutation originalMethod parseTree
		  at: aMTMethodMutation nodeNumber
]

{ #category : 'private' }
MTPredicateBasedMutantOperator >> timesToApplyIn: aCompiledMethod with: aParseTree [
	"Evaluates how many times can the operator be applyied"

	^ (self affectedNodesFor: aParseTree) size
]
