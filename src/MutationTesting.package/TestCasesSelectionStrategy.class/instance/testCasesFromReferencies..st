selecting
testCasesFromReferencies: aTestReferenceCollection 
	"Applies the testCase Selection from a collection of TestCaseReferences and return a collection of TestCaseRefereces."
	
	|testCases selectedTestCases|
	testCases := aTestReferenceCollection collect: [:testReference | testReference testCase].
	selectedTestCases := self testCasesFor: testCases.
	^selectedTestCases collect: [:testCase | TestCaseReference forTestCase: testCase]  
	
