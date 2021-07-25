Class {
	#name : #ExtremeTransformationOperator,
	#superclass : #MutantOperator,
	#category : #'MuTalk-Model-Operators'
}

{ #category : #accessing }
ExtremeTransformationOperator >> description [

	^ 'Remove all body'
]

{ #category : #private }
ExtremeTransformationOperator >> modifiedSourceFor: aCompiledMethod number: aNumber [

	^ self modifiedSourceFor: aCompiledMethod  with: aCompiledMethod ast number: 1 
]

{ #category : #private }
ExtremeTransformationOperator >> modifiedSourceFor: aCompiledMethod with: aParseTree number: aNumber [

	| parser number |
	number := aNumber.
	parser := aParseTree copy.
	oldNode := parser body.
	newNode := RBSequenceNode statements: {  }.
	parser replaceNode: oldNode withNode: newNode.
	^ parser formattedCode
]

{ #category : #'mutant generation' }
ExtremeTransformationOperator >> mutationsFor: aCompiledMethod with: aParseTree [

	((aCompiledMethod hasPragmaNamed: #ignoreForMutations) or: [ 
		 aCompiledMethod hasPragmaNamed: #ignoreForCoverage ]) ifTrue: [ 
		^ Array new ].
	^ { ((MethodMutation
		    for: aCompiledMethod
		    using: self
		    result: (self
				     modifiedSourceFor: aCompiledMethod
				     with: aParseTree
				     number: 1)
		    ofClass: aCompiledMethod methodClass)
		   nodeToMutate: oldNode;
		   mutatedNode: newNode;
		   yourself) }
]
