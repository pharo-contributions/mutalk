Class {
	#name : 'MTSubclassReplacementOperator',
	#superclass : 'MTBlockBasedMutantOperator',
	#instVars : [
		'classesToReplace'
	],
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'printing' }
MTSubclassReplacementOperator >> description [

	^ 'Replace a class reference by a reference to one of its subclasses'
]

{ #category : 'initialization' }
MTSubclassReplacementOperator >> initialize [

	super initialize.
	classesToReplace := Dictionary new
]

{ #category : 'private' }
MTSubclassReplacementOperator >> mutationsFor: aCompiledMethod with: aParseTree [

	| numberOfAffectedNodes |
	((aCompiledMethod hasPragmaNamed: #ignoreForMutations) or: [
		 aCompiledMethod hasPragmaNamed: #ignoreForCoverage ]) ifTrue: [
		^ #(  ) ].

	numberOfAffectedNodes := self
		                         timesToApplyIn: aCompiledMethod
		                         with: aParseTree.
	^ (1 to: numberOfAffectedNodes)
		  inject: OrderedCollection new
		  into: [ :accumulator :nodeIndex |
			  | classToReplace affectedNode |
			  affectedNode := self affectedNodeFor: aParseTree at: nodeIndex.
			  "We know that the affectedNode is on a class reference to a class that exists and has subclasses"
			  classToReplace := self class environment at: affectedNode name.
			  accumulator addAll:
				  (classToReplace subclasses collect: [ :subclass |
					   | newExpression |
					   newExpression := [ :anOldNode |
					                    RBVariableNode named: subclass name ].
					   MTMethodMutation
						   for: aCompiledMethod
						   using: self
						   nodeNumber: nodeIndex
						   ofClass: aCompiledMethod methodClass
						   replacingWith: newExpression ]).
			  accumulator ]
]

{ #category : 'applying' }
MTSubclassReplacementOperator >> nodeSelectionPredicate [

	^ [ :aNode |
	  aNode isVariable and: [
		  (self class environment includesKey: aNode name) and: [
			  | referencedClass |
			  referencedClass := self class environment at: aNode name.
			  referencedClass isClass and: [
				  referencedClass subclasses notEmpty ] ] ] ]
]

{ #category : 'applying' }
MTSubclassReplacementOperator >> subclassesForNode: aNode [
	"pre condition: aNode is a class reference node that exists"

	| referencedClass |
	referencedClass := self class environment at: aNode name.
	^ referencedClass subclasses
]
