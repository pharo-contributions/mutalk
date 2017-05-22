testing
testGettingTheTestCasesThatCoverAMethod
	| analysis testCases|

	analysis := CoverageAnalysis 
		for: (Array with: ClassForTestingCoverage)
		running: TestClassForTestingCoverage suite tests.
	analysis run.
	testCases := analysis result testCasesThatCovers: ClassForTestingCoverage >> #aCoveredMethod.
	self assert: ((testCases collect: [:each | each selector]) includes:#testCase1).
	self deny: ((testCases collect: [:each | each selector]) includes:#testCase3).