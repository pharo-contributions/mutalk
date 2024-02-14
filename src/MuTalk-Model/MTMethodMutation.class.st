Class {
	#name : 'MTMethodMutation',
	#superclass : 'Object',
	#instVars : [
		'nodeNumber',
		'originalMethod',
		'operator',
		'originalClass',
		'testCaseReferences',
		'originalProtocol',
		'data'
	],
	#category : 'MuTalk-Model',
	#package : 'MuTalk-Model'
}

{ #category : 'instance creation' }
MTMethodMutation class >> for: aMethod using: anOperatorApplied nodeNumber: aNodeNumber ofClass: aClass [

	^ self new
		  initializeFor: aMethod
		  using: anOperatorApplied
		  nodeNumber: aNodeNumber
		  ofClass: aClass;
		  yourself
]

{ #category : 'instance creation' }
MTMethodMutation class >> for: aMethod using: anOperatorApplied nodeNumber: aNodeNumber ofClass: aClass withData: anObject [

	^ self new
		  initializeFor: aMethod
		  using: anOperatorApplied
		  nodeNumber: aNodeNumber
		  ofClass: aClass
		  withData: anObject;
		  yourself
]

{ #category : 'comparing' }
MTMethodMutation >> = anObject [
	"Two method mutations are equals if they have the same operator,if they mutate the same method from the same class, and if they have the same node number"

	self == anObject ifTrue: [ ^ true ].
	anObject species = self class ifFalse: [ ^ false ].
	self operator species = anObject operator species ifFalse: [ ^ false ].
	self originalMethod = anObject originalMethod ifFalse: [ ^ false ].
	self originalClass = anObject originalClass ifFalse: [ ^ false ].
	self nodeNumber = anObject nodeNumber ifFalse: [ ^ false ].
	^ true
]

{ #category : 'accessing' }
MTMethodMutation >> data [

	^ data
]

{ #category : 'accessing' }
MTMethodMutation >> data: anObject [

	data := anObject
]

{ #category : 'comparing' }
MTMethodMutation >> hash [

	^ self operator species hash + self originalMethod hash
	  + self originalClass hash + self nodeNumber hash
]

{ #category : 'initialize-release' }
MTMethodMutation >> initializeFor: aMethod using: anOperatorApplied nodeNumber: aNodeNumber ofClass: aClass [

	self
		initializeFor: aMethod
		using: anOperatorApplied
		nodeNumber: aNodeNumber
		ofClass: aClass
		withData: anOperatorApplied newExpression
]

{ #category : 'initialize-release' }
MTMethodMutation >> initializeFor: aMethod using: anOperatorApplied nodeNumber: aNodeNumber ofClass: aClass withData: anObject [

	originalMethod := aMethod.
	originalProtocol := aMethod protocol.
	operator := anOperatorApplied.
	nodeNumber := aNodeNumber.
	originalClass := aClass.
	data := anObject
]

{ #category : 'installing' }
MTMethodMutation >> install [
	"Install the mutant compiling the modified source into the class."

	MTMethodInstaller new
		installFromSourceSilently: self modifiedSource
		in: originalClass
]

{ #category : 'accessing' }
MTMethodMutation >> modifiedSource [

	^ operator
		  modifiedSourceFor: originalMethod
		  number: nodeNumber
		  newExpression: data
]

{ #category : 'accessing' }
MTMethodMutation >> mutatedNode [

	^ operator applyTo: self nodeToMutate
]

{ #category : 'accessing' }
MTMethodMutation >> nodeNumber [

	^ nodeNumber
]

{ #category : 'accessing' }
MTMethodMutation >> nodeNumber: anInteger [ 
	nodeNumber := anInteger
]

{ #category : 'accessing' }
MTMethodMutation >> nodeToMutate [

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
MTMethodMutation >> operator [
	^operator
]

{ #category : 'accessing' }
MTMethodMutation >> originalClass [
	^ originalClass
]

{ #category : 'accessing' }
MTMethodMutation >> originalMethod [
	^originalMethod.
]

{ #category : 'accessing' }
MTMethodMutation >> originalSource [
	^ originalMethod sourceCode asString
]

{ #category : 'printing' }
MTMethodMutation >> printOn: aStream [ 
	aStream nextPutAll: operator description;
		 nextPutAll: ' in ';
		 nextPutAll: originalClass printString;
		nextPutAll: '>>';
		nextPutAll: originalMethod  selector printString.
]

{ #category : 'running' }
MTMethodMutation >> runMutantStoppingOnError: aBoolean [

	| testResults |
	EpMonitor disableDuring: [
		[ self install.
		testResults :=  self runTestsStoppingOnError: aBoolean
  		] ensure: [ self uninstall ] ].
	^ testResults
]

{ #category : 'private' }
MTMethodMutation >> runTestsStoppingOnError: aBoolean [

	| testSuite |
	testSuite := TestSuite named: 'Tests cases for: ' , self printString.
	testSuite addTests: testCaseReferences.
	^ aBoolean
		  ifTrue: [ testSuite runStoppingOnFirstFailOrError ]
		  ifFalse: [ testSuite run ]
]

{ #category : 'private' }
MTMethodMutation >> testCaseReferences [
	^ testCaseReferences
]

{ #category : 'private' }
MTMethodMutation >> testCaseReferences: aCollectionOfTestCaseReferences [
	testCaseReferences := aCollectionOfTestCaseReferences
]

{ #category : 'installing' }
MTMethodMutation >> uninstall [
	"UnInstall the mutant recompiling the original method into the class."

	MTMethodInstaller new
		install: originalMethod
		for: originalMethod selector
		in: originalClass
		withProtocol: originalProtocol
]
