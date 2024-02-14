Class {
	#name : 'MTSubclassReplacementOperator',
	#superclass : 'MTPredicateBasedMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'applying' }
MTSubclassReplacementOperator >> appliesToNode: aNode [

	^ aNode isVariable and: [
		  (self class environment includesKey: aNode name) and: [
			  | referencedClass |
			  referencedClass := self class environment at: aNode name.
			  referencedClass isClass and: [
				  referencedClass subclasses notEmpty ] ] ]
]

{ #category : 'printing' }
MTSubclassReplacementOperator >> description [

	^ 'Replace a class reference by a reference to one of its subclasses'
]

{ #category : 'private' }
MTSubclassReplacementOperator >> mutationsFor: aCompiledMethod with: aParseTree number: nodeIndex storeIn: accumulator [

	| subclasses affectedNode |
	affectedNode := self affectedNodeFor: aParseTree at: nodeIndex.
	"We know that the affectedNode is on a class reference to a class that exists and has subclasses"
	subclasses := self subclassesForNode: affectedNode.
	accumulator addAll: (subclasses collect: [ :subclass |
			 | newExpression |
			 newExpression := RBVariableNode named: subclass name.
			 MTMethodMutation
				 for: aCompiledMethod
				 using: self
				 nodeNumber: nodeIndex
				 ofClass: aCompiledMethod methodClass
				 withData: newExpression ]).
	^ accumulator
]

{ #category : 'instance creation' }
MTSubclassReplacementOperator >> newNodeFrom: anOldNode [

	
]

{ #category : 'applying' }
MTSubclassReplacementOperator >> subclassesForNode: aNode [
	"pre condition: aNode is a class reference node that exists"

	| referencedClass |
	referencedClass := self class environment at: aNode name.
	^ referencedClass subclasses
]
