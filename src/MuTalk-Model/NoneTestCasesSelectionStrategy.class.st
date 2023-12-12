Class {
	#name : 'NoneTestCasesSelectionStrategy',
	#superclass : 'TestCasesSelectionStrategy',
	#category : 'MuTalk-Model-TestCases selection strategies',
	#package : 'MuTalk-Model',
	#tag : 'TestCases selection strategies'
}

{ #category : 'printing' }
NoneTestCasesSelectionStrategy >> description [
	^'Same Tests'
]

{ #category : 'selecting' }
NoneTestCasesSelectionStrategy >> testCasesFor: aTestCollection [ 
	"It returns all same tests from a collection of tests received."
	^aTestCollection
]
