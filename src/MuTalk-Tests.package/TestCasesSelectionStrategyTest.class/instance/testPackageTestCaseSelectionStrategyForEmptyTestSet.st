testing-package
testPackageTestCaseSelectionStrategyForEmptyTestSet

	self assert: (PackageTestCasesSelectionStrategy new testCasesFor: OrderedCollection new ) isEmpty