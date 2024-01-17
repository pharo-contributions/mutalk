Class {
	#name : 'MTClassTestCasesSelectionStrategy',
	#superclass : 'MTTestCasesSelectionStrategy',
	#category : 'MuTalk-Model-TestCases selection strategies',
	#package : 'MuTalk-Model',
	#tag : 'TestCases selection strategies'
}

{ #category : 'printing' }
MTClassTestCasesSelectionStrategy >> description [
	^'Tests in Same Clases'
]

{ #category : 'selecting' }
MTClassTestCasesSelectionStrategy >> testCasesFor: aTestCollection [ 
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
MTClassTestCasesSelectionStrategy >> testClassesFrom: aTestCollection [ 
	^ (aTestCollection collect: [ :testCase | testCase class ]) asSet
]
