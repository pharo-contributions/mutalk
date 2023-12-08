Class {
	#name : 'TestCasesSelectionStrategy',
	#superclass : 'Object',
	#category : 'MuTalk-Model-TestCases selection strategies',
	#package : 'MuTalk-Model',
	#tag : 'TestCases selection strategies'
}

{ #category : 'printing' }
TestCasesSelectionStrategy >> description [
	self subclassResponsibility
]

{ #category : 'selecting' }
TestCasesSelectionStrategy >> testCasesFor: aTestCollection [ 
	self subclassResponsibility
]

{ #category : 'selecting' }
TestCasesSelectionStrategy >> testCasesFromReferencies: aTestReferenceCollection [ 
	"Applies the testCase Selection from a collection of TestCaseReferences and return a collection of TestCaseRefereces."
	
	|testCases selectedTestCases|
	testCases := aTestReferenceCollection collect: [:testReference | testReference testCase].
	selectedTestCases := self testCasesFor: testCases.
	^selectedTestCases collect: [:testCase | TestCaseReference forTestCase: testCase]  
	

]
