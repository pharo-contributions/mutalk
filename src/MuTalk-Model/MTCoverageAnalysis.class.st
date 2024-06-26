Class {
	#name : 'MTCoverageAnalysis',
	#superclass : 'Object',
	#instVars : [
		'result',
		'testCases',
		'currentTest',
		'testRunningElapsedTime',
		'methods'
	],
	#category : 'MuTalk-Model-Coverage',
	#package : 'MuTalk-Model',
	#tag : 'Coverage'
}

{ #category : 'instance creation' }
MTCoverageAnalysis class >> for: aCollectionOfMethods running: aCollectionOfTestCases [

	^ self new
		  initializeFor: aCollectionOfMethods
		  running: aCollectionOfTestCases
]

{ #category : 'instance creation' }
MTCoverageAnalysis class >> forClasses: aCollectionOfClasses running: aCollectionOfTestCases [

	| methodCollection |
	methodCollection := aCollectionOfClasses flatCollect: [ :class |
		                    | methods |
		                    methods := class package methodsForClass: class.
		                    methods addAll:
			                    (class package methodsForClass: class class).
		                    methods ].
	^ self new
		  initializeFor: methodCollection
		  running: aCollectionOfTestCases
]

{ #category : 'private' }
MTCoverageAnalysis >> addTestsFrom: aWrapper to: methodToTestDictionary [ 
	aWrapper tests notEmpty
		ifTrue: [(methodToTestDictionary
				at: aWrapper reference compiledMethod
				ifAbsentPut: [IdentitySet new])
				addAll: aWrapper tests]
]

{ #category : 'accessing' }
MTCoverageAnalysis >> currentTest [
	^ currentTest 
]

{ #category : 'private' }
MTCoverageAnalysis >> currentTest: aTestCase [
	currentTest := aTestCase.
]

{ #category : 'private' }
MTCoverageAnalysis >> flushMethodLookupCaches [
	Behavior flushCache.
	
]

{ #category : 'initialize-release' }
MTCoverageAnalysis >> initializeFor: aCollectionOfMethods running: aCollectionOfTestCases [

	methods := aCollectionOfMethods.
	testCases := aCollectionOfTestCases
]

{ #category : 'private' }
MTCoverageAnalysis >> installAll: wrappers [ 
	wrappers do: [ :each | each install ]
]

{ #category : 'private' }
MTCoverageAnalysis >> methodReferences [

	^ methods collect: [ :aMethod |
		  RGMethodDefinition
			  class: aMethod methodClass
			  selector: aMethod selector ]
]

{ #category : 'private' }
MTCoverageAnalysis >> methodToTestDictionaryFrom: wrappers [ 
	^ wrappers
		inject: IdentityDictionary new
		into: [:methodToTestDictionary :aWrapper | 
			self addTestsFrom: aWrapper to: methodToTestDictionary.
			methodToTestDictionary]
]

{ #category : 'private' }
MTCoverageAnalysis >> methodWrappersFor: methodReferences [ 
	^ methodReferences collect: [ :each | MTMethodWrapperForCoverage on: each for: self ]
]

{ #category : 'accessing' }
MTCoverageAnalysis >> result [
	^result
]

{ #category : 'evaluating' }
MTCoverageAnalysis >> run [

	| wrappers methodReferences |
	methodReferences := self methodReferences.
	wrappers := self methodWrappersFor: methodReferences.
	self runTestsInstalling: wrappers.
	result := MTCoverageAnalysisResult
		          from: (self methodToTestDictionaryFrom: wrappers)
		          elapsedTime: testRunningElapsedTime.
	result methodReferences: methods
]

{ #category : 'private' }
MTCoverageAnalysis >> runTests [

	testRunningElapsedTime := [
	                          | suite |
	                          suite := MTTestSuiteWrappedForCoverage
		                                   for: self
		                                   named: 'Test Suite for Coverage'.
	                          suite addTests: testCases.
	                          suite run ] timeToRun
]

{ #category : 'private' }
MTCoverageAnalysis >> runTestsInstalling: wrappers [ 
	[self installAll: wrappers.
	self flushMethodLookupCaches.
	self runTests]
		ensure: [self uninstallAll: wrappers]
]

{ #category : 'private' }
MTCoverageAnalysis >> uninstallAll: wrappers [ 
	^ wrappers do: [ :each | each uninstall ]
]
