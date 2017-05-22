testing-none
testNoneTestCaseSelectionStrategyForEmptyTestSet

	self assert: (NoneTestCasesSelectionStrategy new testCasesFor: OrderedCollection new ) isEmpty