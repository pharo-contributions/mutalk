Class {
	#name : #MTAbstractMutantOperator,
	#superclass : #Object,
	#category : #'MuTalk-Model-Operators'
}

{ #category : #accessing }
MTAbstractMutantOperator class >> allConcreteSubclasses [

	^ self allSubclasses reject: [ :ea | 
		  ea isAbstract | ea isOriginalOperator not ]
]

{ #category : #accessing }
MTAbstractMutantOperator class >> contents [
	"This returns only the traditional operators "

	^ ((self allConcreteSubclasses reject: #isDeprecated) collect: [
		   :class | class new ]) asSortedCollection: [ :elem1 :elem2 |
		  elem1 description <= elem2 description ]
]

{ #category : #accessing }
MTAbstractMutantOperator class >> contentsAll [
	"This returns all operators (block based and traditional) "

	^ ((self allSubclasses reject: [ :ea |
		    ea isAbstract or: [ ea isDeprecated ] ]) collect: [ :class |
		   class new ]) asSortedCollection: [ :elem1 :elem2 |
		  elem1 description <= elem2 description ]
]

{ #category : #accessing }
MTAbstractMutantOperator class >> contentsFamix [

	^ ((('MuTalk-Model' asPackage classTagNamed: 'Operators-Famix')
		    classes reject: [ :class |
		    class isAbstract or: [ class isDeprecated ] ]) collect: [ :class |
		   class new ]) asSortedCollection: [ :elem1 :elem2 |
		  elem1 description <= elem2 description ]
]

{ #category : #testing }
MTAbstractMutantOperator class >> isAbstract [

	^ self == MTAbstractMutantOperator
]

{ #category : #testing }
MTAbstractMutantOperator class >> isOriginalOperator [

	^ true
]

{ #category : #'as yet unclassified' }
MTAbstractMutantOperator class >> recursionsDetectionStatement [

	^ RBParser parseExpression:
		  ('MuTalkInfiniteRecursionError onCount: {1}' format: { self recursionsDetectionThreshold } )
]

{ #category : #'as yet unclassified' }
MTAbstractMutantOperator class >> recursionsDetectionThreshold [

	"We need a big enough number"

	^ 1024
]

{ #category : #printing }
MTAbstractMutantOperator >> description [
	self subclassResponsibility
]

{ #category : #private }
MTAbstractMutantOperator >> is: originalRBMethodNode equalTo: nodeThatMatches [ 
	^ nodeThatMatches formattedCode = originalRBMethodNode formattedCode
]

{ #category : #private }
MTAbstractMutantOperator >> modifiedSourceFor: aCompiledMethod number: aNumber [

	^ self
		  modifiedSourceFor: aCompiledMethod
		  with: aCompiledMethod parseTree
		  number: aNumber
		  newExpression: self newExpression
]

{ #category : #private }
MTAbstractMutantOperator >> modifiedSourceFor: aCompiledMethod number: aNumber newExpression: anExpression [

	^ self
		  modifiedSourceFor: aCompiledMethod
		  with: aCompiledMethod parseTree
		  number: aNumber
		  newExpression: anExpression
]

{ #category : #private }
MTAbstractMutantOperator >> modifiedSourceFor: aCompiledMethod with: aParseTree number: aNumber newExpression: anExpression [

	self subclassResponsibility
]

{ #category : #'mutant generation' }
MTAbstractMutantOperator >> mutationsFor: aCompiledMethod [ 

	(aCompiledMethod ignoredMutationOperators includes: self class) ifTrue: [ ^ Array new ].

	^self mutationsFor: aCompiledMethod with: aCompiledMethod parseTree.
	
]

{ #category : #'mutant generation' }
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

{ #category : #private }
MTAbstractMutantOperator >> mutationsFor: aCompiledMethod with: aParseTree number: nodeIndex storeIn: accumulator [

	self subclassResponsibility
]

{ #category : #suggestions }
MTAbstractMutantOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [
	^'No Suggestion'
]

{ #category : #applying }
MTAbstractMutantOperator >> timesToApplyIn: aCompiledMethod [ 
	^self timesToApplyIn: aCompiledMethod  with: aCompiledMethod parseTree.
	
]

{ #category : #applying }
MTAbstractMutantOperator >> timesToApplyIn: aCompiledMethod with: aParseTree [

	self subclassResponsibility
]
