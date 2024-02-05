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
			  (classesToReplace add: (self class environment at: aNode name))
				  subclasses isNotEmpty ] ] ]
]

{ #category : 'accessing' }
MTSubclassReplacementOperator >> indexFor: aNode [

	^ aNode startForReplacement
	  + (self class environment at: aNode name) hash
]

{ #category : 'initialization' }
MTSubclassReplacementOperator >> initialize [

	super initialize.
	classesToReplace := OrderedCollection new
]

{ #category : 'private' }
MTSubclassReplacementOperator >> modifiedSourceFor: aCompiledMethod number: aNumber newExpression: anExpression [

	^ self
		  modifiedSourceFor: aCompiledMethod
		  with: aCompiledMethod parseTree
		  number: aNumber
		  newExpression: anExpression
]

{ #category : 'private' }
MTSubclassReplacementOperator >> modifiedSourceFor: aCompiledMethod with: aParseTree number: aNumber newExpression: anExpression [

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
MTSubclassReplacementOperator >> mutationFor: aCompiledMethod with: aParseTree number: aNumberOfSelector storeIn: aCollection [

	| classToReplace |
	classToReplace := classesToReplace at: aNumberOfSelector.
	aCollection addAll:
		((1 to: classToReplace subclasses size) collect: [ :index |
			 | newExpression |
			 newExpression := self
				                  newExpressionForClass: aNumberOfSelector
				                  andSubclass: index.
			 MTParametricMethodMutation
				 for: aCompiledMethod
				 using: self
				 nodeNumber: aNumberOfSelector
				 ofClass: aCompiledMethod methodClass
				 replacingWith: newExpression ]).
	^ aCollection
]

{ #category : 'applying' }
MTSubclassReplacementOperator >> newExpression [

	
]

{ #category : 'applying' }
MTSubclassReplacementOperator >> newExpressionForClass: classIndex andSubclass: subclassIndex [

	^ [ :anOldNode |
	  | nodeCopy |
	  nodeCopy := anOldNode copy.
	  nodeCopy name:
		  ((classesToReplace at: classIndex) subclasses at: subclassIndex) name.
	  nodeCopy ]
]
