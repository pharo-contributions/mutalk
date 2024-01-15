Class {
	#name : 'MTCoverageAnalysis',
	#superclass : 'Object',
	#instVars : [
		'classes',
		'result',
		'classesAndMetaclasses',
		'testCases',
		'currentTest',
		'testRunningElapsedTime'
	],
	#category : 'MuTalk-Model',
	#package : 'MuTalk-Model'
}

{ #category : 'instance creation' }
MTCoverageAnalysis class >> for: aCollectionOfClasses running: aCollectionOfTestCases [
	^self new initializeFor: aCollectionOfClasses running: aCollectionOfTestCases
]

{ #category : 'private' }
MTCoverageAnalysis >> addTestsFrom: aWrapper to: methodToTestDictionary [ 
	aWrapper tests notEmpty
		ifTrue: [(methodToTestDictionary
				at: aWrapper reference compiledMethod
				ifAbsentPut: [IdentitySet new])
				addAll: aWrapper tests]
]

{ #category : 'private' }
MTCoverageAnalysis >> classesAndMetaclasses [
	classesAndMetaclasses isNil ifTrue:[
		classesAndMetaclasses := (classes collect:[:aClass | aClass class]) asOrderedCollection.
		classesAndMetaclasses addAll: classes.].
	^classesAndMetaclasses.

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
MTCoverageAnalysis >> initializeFor: aCollectionOfClasses running: aCollectionOfTestCases [ 
	classes := aCollectionOfClasses. 
	testCases := aCollectionOfTestCases
]

{ #category : 'private' }
MTCoverageAnalysis >> installAll: wrappers [ 
	wrappers do: [ :each | each install ]
]

{ #category : 'private' }
MTCoverageAnalysis >> methodReferences [
	^ self classesAndMetaclasses
		inject: OrderedCollection new
		into: [:methodReferences :aClass | 
			methodReferences
				addAll: (aClass selectors
						collect: [:aSelector | RGMethodDefinition class: aClass selector: aSelector]).
			methodReferences]
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
	result methodReferences: (self classesAndMetaclasses flatCollect: [:cls | cls methods])
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
