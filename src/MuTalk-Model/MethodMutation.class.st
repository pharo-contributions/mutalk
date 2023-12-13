Class {
	#name : 'MethodMutation',
	#superclass : 'Object',
	#instVars : [
		'nodeNumber',
		'originalMethod',
		'operator',
		'originalClass',
		'testCaseReferences',
		'originalProtocol'
	],
	#category : 'MuTalk-Model',
	#package : 'MuTalk-Model'
}

{ #category : 'instance creation' }
MethodMutation class >> for: aMethod using: anOperatorApplied nodeNumber: aNodeNumber ofClass: aClass [
	^ self new
		initializeFor: aMethod
		using: anOperatorApplied
		nodeNumber: aNodeNumber
		ofClass: aClass;
		 yourself
]

{ #category : 'comparing' }
MethodMutation >> = anObject [
	"Two method mutations are equals if they have the same operator, and if they mutate the same method from the same class"

	anObject species = self class ifFalse: [ ^ false ].
	self operator species = anObject operator species ifFalse: [ ^ false ].
	self originalMethod = anObject originalMethod ifFalse: [ ^ false ].
	self originalClass = anObject originalClass ifFalse: [ ^ false ].
	self nodeNumber = anObject nodeNumber ifFalse: [ ^ false ].
	^ true
]

{ #category : 'initialize-release' }
MethodMutation >> initializeFor: aMethod using: anOperatorApplied nodeNumber: aNodeNumber ofClass: aClass [
	originalMethod := aMethod.
	originalProtocol := aMethod protocol.
	operator := anOperatorApplied.
	nodeNumber := aNodeNumber.
	originalClass := aClass
]

{ #category : 'installing' }
MethodMutation >> install [
	"Install the mutant compiling the modified source into the class."

	MethodInstaller new
		installFromSourceSilently: self modifiedSource
		in: originalClass
]

{ #category : 'accessing' }
MethodMutation >> modifiedSource [

	^ operator modifiedSourceFor: originalMethod number: nodeNumber
]

{ #category : 'accessing' }
MethodMutation >> mutatedNode [

	^ operator applyTo: self nodeToMutate
]

{ #category : 'accessing' }
MethodMutation >> nodeNumber [

	^ nodeNumber
]

{ #category : 'accessing' }
MethodMutation >> nodeNumber: anInteger [ 
	nodeNumber := anInteger
]

{ #category : 'accessing' }
MethodMutation >> nodeToMutate [

	| n searcher |
	n := 1.
	searcher := RBParseTreeSearcher new
		            matches: operator expressionToReplace
		            do: [ :node :answer | 
			            n = nodeNumber ifTrue: [ ^ node ].
			            n := n + 1 ];
		            yourself.
	searcher executeTree: originalMethod ast.
	self error: 'Not found'
]

{ #category : 'accessing' }
MethodMutation >> operator [
	^operator
]

{ #category : 'accessing' }
MethodMutation >> originalClass [
	^ originalClass
]

{ #category : 'accessing' }
MethodMutation >> originalMethod [
	^originalMethod.
]

{ #category : 'accessing' }
MethodMutation >> originalSource [
	^ originalMethod sourceCode asString
]

{ #category : 'printing' }
MethodMutation >> printOn: aStream [ 
	aStream nextPutAll: operator description;
		 nextPutAll: ' in ';
		 nextPutAll: originalClass printString;
		nextPutAll: '>>';
		nextPutAll: originalMethod  selector printString.
]

{ #category : 'running' }
MethodMutation >> runMutant [

	^ [ 
		self install.
		self runTests
	] ensure: [ self uninstall ]
]

{ #category : 'private' }
MethodMutation >> runTests [

	^ (TestSuite named: 'Tests cases for: ' , self printString)
		  addTests: testCaseReferences;
		  runStoppingOnFirstFailOrError
]

{ #category : 'private' }
MethodMutation >> testCaseReferences [
	^ testCaseReferences
]

{ #category : 'private' }
MethodMutation >> testCaseReferences: aCollectionOfTestCaseReferences [
	testCaseReferences := aCollectionOfTestCaseReferences
]

{ #category : 'installing' }
MethodMutation >> uninstall [
	"UnInstall the mutant recompiling the original method into the class."

	MethodInstaller new
		install: originalMethod
		for: originalMethod selector
		in: originalClass
		withProtocol: originalProtocol
]
