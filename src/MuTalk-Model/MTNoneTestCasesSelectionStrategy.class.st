Class {
	#name : #MTNoneTestCasesSelectionStrategy,
	#superclass : #MTTestCasesSelectionStrategy,
	#category : 'MuTalk-Model-TestCases selection strategies'
}

{ #category : #printing }
MTNoneTestCasesSelectionStrategy >> description [
	^'Same Tests'
]

{ #category : #selecting }
MTNoneTestCasesSelectionStrategy >> testCasesFor: aTestCollection [ 
	"It returns all same tests from a collection of tests received."
	^aTestCollection
]
