Class {
	#name : 'MTAbstractMutantOperator',
	#superclass : 'Object',
	#category : 'MuTalk-Model-Operators - Abstract',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Abstract'
}

{ #category : 'accessing' }
MTAbstractMutantOperator class >> allConcreteSubclasses [

	^ self allSubclasses reject: #isAbstract
]

{ #category : 'accessing' }
MTAbstractMutantOperator class >> contents [
	"This returns only the traditional operators "

	^ ((self allConcreteSubclasses reject: #isDeprecated) collect: [
		   :class | class new ]) asSortedCollection: [ :elem1 :elem2 |
		  elem1 description <= elem2 description ]
]

{ #category : 'testing' }
MTAbstractMutantOperator class >> isAbstract [

	^ self == MTAbstractMutantOperator
]

{ #category : 'as yet unclassified' }
MTAbstractMutantOperator class >> recursionsDetectionStatement [

	^ RBParser parseExpression:
		  ('MuTalkInfiniteRecursionError onCount: {1}' format: { self recursionsDetectionThreshold } )
]

{ #category : 'as yet unclassified' }
MTAbstractMutantOperator class >> recursionsDetectionThreshold [

	"We need a big enough number"

	^ 1024
]

{ #category : 'printing' }
MTAbstractMutantOperator >> applyTo: anOldNode [

	| rewriter |
	rewriter := RBParseTreeRewriter new.
	rewriter
		replace: self expressionToReplace
		withValueFrom: [ :oNode | | aNewNode |
			aNewNode := RBParser parseRewriteExpression: self newExpression.
			aNewNode copyInContext: rewriter context ].
	rewriter executeTree: anOldNode copy.
	^ rewriter tree
]

{ #category : 'printing' }
MTAbstractMutantOperator >> description [
	self subclassResponsibility
]

{ #category : 'printing' }
MTAbstractMutantOperator >> expressionToReplace [

	^ self subclassResponsibility
]

{ #category : 'private' }
MTAbstractMutantOperator >> is: originalRBMethodNode equalTo: nodeThatMatches [ 
	^ nodeThatMatches formattedCode = originalRBMethodNode formattedCode
]

{ #category : 'private' }
MTAbstractMutantOperator >> modifiedSourceFor: aCompiledMethod number: aNumber [

	^ self
		  modifiedSourceFor: aCompiledMethod
		  with: aCompiledMethod parseTree
		  number: aNumber
		  newExpression: self newExpression
]

{ #category : 'private' }
MTAbstractMutantOperator >> modifiedSourceFor: aCompiledMethod number: aNumber newExpression: anExpression [

	^ self
		  modifiedSourceFor: aCompiledMethod
		  with: aCompiledMethod parseTree
		  number: aNumber
		  newExpression: anExpression
]

{ #category : 'private' }
MTAbstractMutantOperator >> modifiedSourceFor: aCompiledMethod with: aParseTree number: aNumber newExpression: anExpression [

	self subclassResponsibility
]

{ #category : 'mutant generation' }
MTAbstractMutantOperator >> mutationsFor: aCompiledMethod [ 

	(aCompiledMethod ignoredMutationOperators includes: self class) ifTrue: [ ^ Array new ].

	^self mutationsFor: aCompiledMethod with: aCompiledMethod parseTree.
	
]

{ #category : 'mutant generation' }
MTAbstractMutantOperator >> mutationsFor: aCompiledMethod with: aParseTree [

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
			  self
				  mutationsFor: aCompiledMethod
				  with: aParseTree
				  number: nodeIndex
				  storeIn: accumulator ]
]

{ #category : 'private' }
MTAbstractMutantOperator >> mutationsFor: aCompiledMethod with: aParseTree number: nodeIndex storeIn: accumulator [

	self subclassResponsibility
]

{ #category : 'printing' }
MTAbstractMutantOperator >> newExpression [
	self subclassResponsibility
]

{ #category : 'suggestions' }
MTAbstractMutantOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [
	^'No Suggestion'
]

{ #category : 'applying' }
MTAbstractMutantOperator >> timesToApplyIn: aCompiledMethod [ 
	^self timesToApplyIn: aCompiledMethod  with: aCompiledMethod parseTree.
	
]

{ #category : 'applying' }
MTAbstractMutantOperator >> timesToApplyIn: aCompiledMethod with: aParseTree [

	self subclassResponsibility
]
