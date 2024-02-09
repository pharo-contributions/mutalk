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

{ #category : 'applying' }
MTSubclassReplacementOperator >> expressionToReplace [

	^ [ :aNode |
	  aNode isVariable and: [
		  (self class environment includesKey: aNode name) and: [
			  | referencedClass shouldReplace |
			  referencedClass := self class environment at: aNode name.
			  shouldReplace := referencedClass isClass and: [
				                   referencedClass subclasses notEmpty ].
			  shouldReplace ifTrue: [ self addClassInDictionary: referencedClass forMethodOf: aNode ].
			  shouldReplace ] ] ]
]

{ #category : 'initialization' }
MTSubclassReplacementOperator >> initialize [

	super initialize.
	classesToReplace := Dictionary new
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
			Halt if: [ aCompiledMethod = (UUID>>#initialize) ].
			 MTMethodMutation
				 for: aCompiledMethod
				 using: self
				 nodeNumber: aNumberOfSelector
				 ofClass: aCompiledMethod methodClass
				 replacingWith: newExpression ]).
	^ aCollection
]

{ #category : 'applying' }
MTSubclassReplacementOperator >> newExpressionForClass: classIndex andSubclass: subclassIndex [

	^ [ :anOldNode |
	  | nodeCopy |
	  nodeCopy := anOldNode copy.
	  nodeCopy name:
		  ((classesToReplace at: classIndex) subclasses at: subclassIndex)
			  name.
	  nodeCopy ]
]
