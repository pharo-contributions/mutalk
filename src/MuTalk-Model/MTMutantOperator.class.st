Class {
	#name : 'MTMutantOperator',
	#superclass : 'Object',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'accessing' }
MTMutantOperator class >> allConcreteSubclasses [

	^ self allSubclasses reject: [ :ea | 
		  ea isAbstract | ea isOriginalOperator not ]
]

{ #category : 'accessing' }
MTMutantOperator class >> contents [
	"This returns only the traditional operators "

	^ ((self allConcreteSubclasses reject: #isDeprecated) collect: [
		   :class | class new ]) asSortedCollection: [ :elem1 :elem2 |
		  elem1 description <= elem2 description ]
]

{ #category : 'accessing' }
MTMutantOperator class >> contentsAll [
	"This returns all operators (block based and traditional) "

	^ ((self allSubclasses reject: [ :ea |
		    ea isAbstract or: [ ea isDeprecated ] ]) collect: [ :class |
		   class new ]) asSortedCollection: [ :elem1 :elem2 |
		  elem1 description <= elem2 description ]
]

{ #category : 'testing' }
MTMutantOperator class >> isAbstract [

	^ self == MTMutantOperator
]

{ #category : 'testing' }
MTMutantOperator class >> isOriginalOperator [
	^ true
]

{ #category : 'as yet unclassified' }
MTMutantOperator class >> recursionsDetectionStatement [

	^ RBParser parseExpression:
		  ('MuTalkInfiniteRecursionError onCount: {1}' format: { self recursionsDetectionThreshold } )
]

{ #category : 'as yet unclassified' }
MTMutantOperator class >> recursionsDetectionThreshold [

	"We need a big enough number"

	^ 1024
]

{ #category : 'applying' }
MTMutantOperator >> applyTo: anOldNode [

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
MTMutantOperator >> description [
	self subclassResponsibility
]

{ #category : 'applying' }
MTMutantOperator >> expressionToReplace [
	self subclassResponsibility
]

{ #category : 'private' }
MTMutantOperator >> is: originalRBMethodNode equalTo: nodeThatMatches [ 
	^ nodeThatMatches formattedCode = originalRBMethodNode formattedCode
]

{ #category : 'private' }
MTMutantOperator >> isAPosibleMutatedNode: aRBMethodNode [ 
	|nodeThatMatches |
	
	nodeThatMatches := (RBParseTreeSearcher treeMatching: self newExpression
												  in: aRBMethodNode). 
	
	^ nodeThatMatches notNil and: [self is: nodeThatMatches equalTo: aRBMethodNode]
]

{ #category : 'private' }
MTMutantOperator >> isAPosibleNodeToMutate: aRBMethodNode [ 
	| nodeThatMatches |
	nodeThatMatches := RBParseTreeSearcher treeMatching: self expressionToReplace
												in: aRBMethodNode.
	
	^ nodeThatMatches notNil and: [ self is: aRBMethodNode equalTo: nodeThatMatches ]
]

{ #category : 'testing' }
MTMutantOperator >> isNodeOfMutation: posibleMutatedRBMethodNode comparingWith: originalRBMethodNode [ 
	^ (self isAPosibleNodeToMutate: originalRBMethodNode) 
		and: [ self isAPosibleMutatedNode: posibleMutatedRBMethodNode ]
]

{ #category : 'private' }
MTMutantOperator >> modifiedSourceFor: aCompiledMethod number: aNumber [ 
	"this method must be removed, it is only added because some tests send this message - Gabo"
		^self modifiedSourceFor: aCompiledMethod with: aCompiledMethod parseTree number: aNumber 
]

{ #category : 'private' }
MTMutantOperator >> modifiedSourceFor: aCompiledMethod with: aParseTree number: aNumber [

	| rewriter parser number nNode |
	rewriter := RBParseTreeRewriter new.
	number := aNumber.
	parser := aParseTree copy.
	rewriter
		replace: self expressionToReplace
		withValueFrom: [ :oNode | 
			| oldNode newNode |
			nNode := RBParser parseRewriteExpression: self newExpression.
			nNode := nNode copyInContext: rewriter context.
			oldNode := oNode.
			newNode := nNode.
			newNode ]
		when: [ :node | 
			number := number - 1.
			number = 0 ].
	rewriter executeTree: parser.
	parser := rewriter tree.
	^ parser formattedCode
]

{ #category : 'private' }
MTMutantOperator >> mutationFor: aCompiledMethod with: aParseTree number: aNumberOfSelector [

	^ MTMethodMutation
		  for: aCompiledMethod
		  using: self
		  nodeNumber: aNumberOfSelector
		  ofClass: aCompiledMethod methodClass
]

{ #category : 'mutant generation' }
MTMutantOperator >> mutationsFor: aCompiledMethod [ 

	(aCompiledMethod ignoredMutationOperators includes: self class) ifTrue: [ ^ Array new ].

	^self mutationsFor: aCompiledMethod with: aCompiledMethod parseTree.
	
]

{ #category : 'mutant generation' }
MTMutantOperator >> mutationsFor: aCompiledMethod with: aParseTree [

	| numberOfMutations |
	numberOfMutations := ((aCompiledMethod hasPragmaNamed:
		                       #ignoreForMutations) or: [
		                      aCompiledMethod hasPragmaNamed:
			                      #ignoreForCoverage ])
		                     ifTrue: [ ^ Array new ]
		                     ifFalse: [
		                     self
			                     timesToApplyIn: aCompiledMethod
			                     with: aParseTree ].
	^ (1 to: numberOfMutations)
		  inject: OrderedCollection new
		  into: [ :coll :aNumberOfSelector |
			  | mutation |
			  mutation := self
				              mutationFor: aCompiledMethod
				              with: aParseTree
				              number: aNumberOfSelector.
			  mutation isArray
				  ifTrue: [ coll addAll: mutation ]
				  ifFalse: [ coll add: mutation ].
			  coll ]
]

{ #category : 'applying' }
MTMutantOperator >> newExpression [
	self subclassResponsibility
]

{ #category : 'suggestions' }
MTMutantOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [
	^'No Suggestion'
]

{ #category : 'applying' }
MTMutantOperator >> timesToApplyIn: aCompiledMethod [ 
	^self timesToApplyIn: aCompiledMethod  with: aCompiledMethod parseTree.
	
]

{ #category : 'applying' }
MTMutantOperator >> timesToApplyIn: aCompiledMethod with: aParseTree [ 
	"Evaluates how many times can the operator be applyied"	
	|searcher timesToApply|
	searcher := RBParseTreeSearcher new.
	timesToApply := 0.
	searcher matches:self expressionToReplace do:[:node :answer | timesToApply := timesToApply + 1].
	searcher executeTree: aParseTree copy.
	^timesToApply.
	
]
