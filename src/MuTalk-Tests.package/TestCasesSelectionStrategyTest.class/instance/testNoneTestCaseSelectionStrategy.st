as yet unclassified
testNoneTestCaseSelectionStrategy
	| testCase |
	testCase := TestClassForTestingCoverage selector: #testCase1.
	self assert: (NoneTestCasesSelectionStrategy new
			testCasesFor: (OrderedCollection with: testCase))
			= (OrderedCollection with: testCase)