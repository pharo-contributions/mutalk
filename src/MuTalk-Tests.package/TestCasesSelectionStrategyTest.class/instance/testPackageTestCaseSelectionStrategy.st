as yet unclassified
testPackageTestCaseSelectionStrategy
	| testCase |
	testCase := TestClassForTestingCoverage selector: #testCase1.
	self
		assert: (self
				allTestsIn: (PackageTestCasesSelectionStrategy new
						testCasesFor: (OrderedCollection with: testCase))
				areIncludedIn: (self allTestsFromPackage))