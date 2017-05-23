testing
testGettingTheTestCasesThatCoverAClassMethod
	| analysis testCases|
	analysis := CoverageAnalysis
		for: (Array with: ClassForTestingCoverage)
		running: TestClassForTestingCoverage suite tests.
	analysis run.
	testCases := analysis result testCasesThatCovers: ClassForTestingCoverage class >> #aClassCoveredMethod.
	
	self assert: ((testCases collect: [:each | each selector]) includes:#testCaseThatCoversAClassMethod).

