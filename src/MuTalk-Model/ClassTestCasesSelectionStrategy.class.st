Class {
	#name : 'ClassTestCasesSelectionStrategy',
	#superclass : 'TestCasesSelectionStrategy',
	#category : 'MuTalk-Model-TestCases selection strategies',
	#package : 'MuTalk-Model',
	#tag : 'TestCases selection strategies'
}

{ #category : 'printing' }
ClassTestCasesSelectionStrategy >> description [
	^'Tests in Same Clases'
]

{ #category : 'selecting' }
ClassTestCasesSelectionStrategy >> testCasesFor: aTestCollection [ 
	"Returns all tests in testClases from a collection of tests."
	
	| testClasses |
	testClasses := self testClassesFrom: aTestCollection.
	^ testClasses 
		inject: OrderedCollection new
		into: 
			[ :resultTests :testClass | 
			resultTests addAll: testClass suite tests.
			resultTests ]
]

{ #category : 'selecting' }
ClassTestCasesSelectionStrategy >> testClassesFrom: aTestCollection [ 
	^ (aTestCollection collect: [ :testCase | testCase class ]) asSet
]
