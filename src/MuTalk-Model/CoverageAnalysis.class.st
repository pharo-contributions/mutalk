Class {
	#name : #CoverageAnalysis,
	#superclass : #Object,
	#instVars : [
		'classes',
		'result',
		'classesAndMetaclasses',
		'testCases',
		'currentTest',
		'testRunningElapsedTime'
	],
	#category : 'MuTalk-Model'
}

{ #category : #'instance creation' }
CoverageAnalysis class >> for: aCollectionOfClasses running: aCollectionOfTestCases [
	^self new initializeFor: aCollectionOfClasses running: aCollectionOfTestCases
]

{ #category : #private }
CoverageAnalysis >> addTestsFrom: aWrapper to: methodToTestDictionary [ 
	aWrapper tests notEmpty
		ifTrue: [(methodToTestDictionary
				at: aWrapper reference compiledMethod
				ifAbsentPut: [IdentitySet new])
				addAll: aWrapper tests]
]

{ #category : #private }
CoverageAnalysis >> classesAndMetaclasses [
	classesAndMetaclasses isNil ifTrue:[
		classesAndMetaclasses := (classes collect:[:aClass | aClass class]) asOrderedCollection.
		classesAndMetaclasses addAll: classes.].
	^classesAndMetaclasses.

]

{ #category : #accessing }
CoverageAnalysis >> currentTest [
	^ currentTest 
]

{ #category : #private }
CoverageAnalysis >> currentTest: aTestCase [
	currentTest := aTestCase.
]

{ #category : #private }
CoverageAnalysis >> flushMethodLookupCaches [
	Behavior flushCache.
	
]

{ #category : #'initialize-release' }
CoverageAnalysis >> initializeFor: aCollectionOfClasses running: aCollectionOfTestCases [ 
	classes := aCollectionOfClasses. 
	testCases := aCollectionOfTestCases
]

{ #category : #private }
CoverageAnalysis >> installAll: wrappers [ 
	wrappers do: [ :each | each install ]
]

{ #category : #private }
CoverageAnalysis >> methodReferences [
	^ self classesAndMetaclasses
		inject: OrderedCollection new
		into: [:methodReferences :aClass | 
			methodReferences
				addAll: (aClass selectors
						collect: [:aSelector | RGMethodDefinition class: aClass selector: aSelector]).
			methodReferences]
]

{ #category : #private }
CoverageAnalysis >> methodToTestDictionaryFrom: wrappers [ 
	^ wrappers
		inject: IdentityDictionary new
		into: [:methodToTestDictionary :aWrapper | 
			self addTestsFrom: aWrapper to: methodToTestDictionary.
			methodToTestDictionary]
]

{ #category : #private }
CoverageAnalysis >> methodWrappersFor: methodReferences [ 
	^ methodReferences collect: [ :each | MethodWrapperForCoverage on: each for: self ]
]

{ #category : #accessing }
CoverageAnalysis >> result [
	^result
]

{ #category : #evaluating }
CoverageAnalysis >> run [
	| wrappers methodReferences |
	methodReferences := self methodReferences.
	wrappers := self methodWrappersFor: methodReferences.
	self runTestsInstalling: wrappers.
	result := CoverageAnalysisResult from: (self methodToTestDictionaryFrom: wrappers) elapsedTime: testRunningElapsedTime
]

{ #category : #private }
CoverageAnalysis >> runTests [
	|suite|
	testRunningElapsedTime := Time millisecondsToRun: 
		[suite := TestSuiteWrappedForCoverage for:self named: 'Test Suite for Coverage'.
		 suite addTests: testCases.
	    suite run ].
]

{ #category : #private }
CoverageAnalysis >> runTestsInstalling: wrappers [ 
	[self installAll: wrappers.
	self flushMethodLookupCaches.
	self runTests]
		ensure: [self uninstallAll: wrappers]
]

{ #category : #private }
CoverageAnalysis >> uninstallAll: wrappers [ 
	^ wrappers do: [ :each | each uninstall ]
]
