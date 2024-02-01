Class {
	#name : 'MTSubclassReplacementOperator',
	#superclass : 'MTBlockBasedMutantOperator',
	#instVars : [
		'classesToReplace',
		'counter'
	],
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'printing' }
MTSubclassReplacementOperator >> description [

	^ 'Replace a class reference by a reference to one of its subclasses'
]

{ #category : 'applying' }
MTSubclassReplacementOperator >> expressionToReplace [

	^ [ :aNode |
	  aNode isVariable and: [
		  (self class environment includesKey: aNode name) and: [
			  (classesToReplace
				   at: (self indexFor: aNode)
				   put: (self class environment at: aNode name)) subclasses
				  isNotEmpty ] ] ]
]

{ #category : 'accessing' }
MTSubclassReplacementOperator >> indexFor: aNode [

	^ aNode startForReplacement
	  + (self class environment at: aNode name) hash
]

{ #category : 'initialization' }
MTSubclassReplacementOperator >> initialize [

	super initialize.
	classesToReplace := Dictionary new
]

{ #category : 'private' }
MTSubclassReplacementOperator >> mutationFor: aCompiledMethod with: aParseTree number: aNumberOfSelector [

	| mutations |
	mutations := (1 to: 2) collect: [ :i |
		             MTMethodMutation
			             for: aCompiledMethod
			             using: self
			             nodeNumber: aNumberOfSelector
			             ofClass: aCompiledMethod methodClass ].
	self resetCounter.
	^ mutations
]

{ #category : 'applying' }
MTSubclassReplacementOperator >> newExpression [

	^ [ :anOldNode |
	  | nodeCopy |
	  nodeCopy := anOldNode copy.
	  nodeCopy name:
		  ((classesToReplace at: (self indexFor: anOldNode)) subclasses at:
			   counter) name.
	  counter := counter + 1.
	  nodeCopy ]
]

{ #category : 'initialization' }
MTSubclassReplacementOperator >> resetCounter [

	counter := 1
]
