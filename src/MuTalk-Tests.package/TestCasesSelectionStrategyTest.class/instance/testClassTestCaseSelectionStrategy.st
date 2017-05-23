as yet unclassified
testClassTestCaseSelectionStrategy
	| testCase |
	testCase := TestClassForTestingCoverage selector: #testCase1.
	self
		assert: (self
				allTestsIn: (ClassTestCasesSelectionStrategy new
						testCasesFor: (OrderedCollection with: testCase))
				areIncludedIn: TestClassForTestingCoverage suite tests)