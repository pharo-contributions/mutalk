Class {
	#name : #MTTestCasesSelectionStrategy,
	#superclass : #Object,
	#category : 'MuTalk-Model-TestCases selection strategies'
}

{ #category : #printing }
MTTestCasesSelectionStrategy >> description [
	self subclassResponsibility
]

{ #category : #selecting }
MTTestCasesSelectionStrategy >> testCasesFor: aTestCollection [ 
	self subclassResponsibility
]

{ #category : #selecting }
MTTestCasesSelectionStrategy >> testCasesFromReferencies: aTestReferenceCollection [
	"Applies the testCase Selection from a collection of TestCaseReferences and return a collection of TestCaseRefereces."

	| testCases selectedTestCases |
	testCases := aTestReferenceCollection collect: [ :testReference |
		             testReference testCase ].
	selectedTestCases := self testCasesFor: testCases.
	^ selectedTestCases collect: [ :testCase |
		  MTTestCaseReference forTestCase: testCase ]
]
