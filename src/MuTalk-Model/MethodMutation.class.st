Class {
	#name : #MethodMutation,
	#superclass : #Object,
	#instVars : [
		'originalMethod',
		'modifiedSource',
		'operator',
		'originalClass',
		'mutatedNode',
		'nodeToMutate',
		'testSuite'
	],
	#category : 'MuTalk-Model'
}

{ #category : #'instance creation' }
MethodMutation class >> for: aMethod using: anOperatorApplied result: aModifiedSource ofClass: aClass [
	^ self new
		initializeFor: aMethod
		using: anOperatorApplied
		result: aModifiedSource
		ofClass: aClass;
		 yourself
]

{ #category : #'initialize-release' }
MethodMutation >> initializeFor: aMethod using: anOperatorApplied result: aModifiedSource ofClass: aClass [
	originalMethod := aMethod.
	operator := anOperatorApplied.
	modifiedSource := aModifiedSource.
	originalClass := aClass
]

{ #category : #installing }
MethodMutation >> install [
	"Install the mutant compiling the modified source into the class."
	MethodInstaller new installFromSource: modifiedSource in: originalClass
]

{ #category : #private }
MethodMutation >> lookUpForNodesFromChildrenOfMutated: aPossibleMutatedRBMethodNode comparingWithChildrenOfOriginal: anOriginalRBMethodNode [ 
	| childrenOfMutatedMethod childrenOfOriginalMethod |
	childrenOfMutatedMethod := aPossibleMutatedRBMethodNode children.
	childrenOfOriginalMethod := anOriginalRBMethodNode children.
	1 to: childrenOfMutatedMethod size do: 
		[ :childNumber | 
			self lookUpForNodesFromMutated:  (childrenOfMutatedMethod at: childNumber)
				  comparingWithOriginal: (childrenOfOriginalMethod at: childNumber).
			mutatedNode ifNotNil: [^self]]

	
]

{ #category : #private }
MethodMutation >> lookUpForNodesFromMutated: aPossibleMutatedRBMethodNode comparingWithOriginal: anOriginalRBMethodNode [ 
	(self operator 
		isNodeOfMutation: aPossibleMutatedRBMethodNode
		comparingWith: anOriginalRBMethodNode) ifTrue: 
		[ nodeToMutate := anOriginalRBMethodNode.
		mutatedNode := aPossibleMutatedRBMethodNode ].
	aPossibleMutatedRBMethodNode children isEmpty ifTrue: [ ^ nil ].
	^ self 
		lookUpForNodesFromChildrenOfMutated: aPossibleMutatedRBMethodNode
		comparingWithChildrenOfOriginal: anOriginalRBMethodNode
]

{ #category : #private }
MethodMutation >> lookupForNodes [
	self lookUpForNodesFromMutated: (RBParser parseMethod: self modifiedSource)
		  comparingWithOriginal: (RBParser parseMethod: self originalSource ).
]

{ #category : #accessing }
MethodMutation >> modifiedSource [
	^ modifiedSource
]

{ #category : #accessing }
MethodMutation >> mutatedNode [
	mutatedNode ifNil:[self lookupForNodes ].
	^mutatedNode. 
]

{ #category : #accessing }
MethodMutation >> mutatedNode: aNode [
	mutatedNode := aNode
]

{ #category : #accessing }
MethodMutation >> nodeToMutate [
	nodeToMutate ifNil: [ self lookupForNodes ].
	^ nodeToMutate
]

{ #category : #accessing }
MethodMutation >> nodeToMutate: aNode [
	nodeToMutate := aNode
]

{ #category : #accessing }
MethodMutation >> operator [
	^operator
]

{ #category : #accessing }
MethodMutation >> originalClass [
	^ originalClass
]

{ #category : #accessing }
MethodMutation >> originalMethod [
	^originalMethod.
]

{ #category : #accessing }
MethodMutation >> originalSource [
	^ originalMethod sourceCode asString
]

{ #category : #printing }
MethodMutation >> printOn: aStream [ 
	aStream nextPutAll: operator description;
		 nextPutAll: ' in ';
		 nextPutAll: originalClass printString;
		nextPutAll: '>>';
		nextPutAll: originalMethod  selector printString.
]

{ #category : #private }
MethodMutation >> run [
	^ [ testSuite runStoppingOnFirstFailOrError ] 
		on: Error
		do: [ :ex | nil ]
]

{ #category : #running }
MethodMutation >> runMutant [

	^ [ 
		self install.
		self run 
	] ensure: [ self uninstall ]
]

{ #category : #printing }
MethodMutation >> testSuite [
	^ testSuite
]

{ #category : #printing }
MethodMutation >> testSuite: aTestSuite [
	testSuite := aTestSuite
]

{ #category : #installing }
MethodMutation >> uninstall [
	"UnInstall the mutant recompiling the original method into the class."
	MethodInstaller new install:originalMethod for: originalMethod selector in: originalClass 
]
