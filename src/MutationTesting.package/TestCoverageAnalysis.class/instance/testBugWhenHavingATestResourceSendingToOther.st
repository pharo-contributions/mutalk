testing
testBugWhenHavingATestResourceSendingToOther
	"the problem was when sending from a resource a message to another object wich class is going to be considered for coverage"
	| analysis testCases|
	analysis := CoverageAnalysis
		for: (Array with: ClassForTestingCoverage with:TestResourceClassForTestingCoverage)
		running: TestClassForTestingCoverage suite tests.
	analysis run.
	testCases := analysis result testCasesThatCovers: ClassForTestingCoverage class >> #aClassCoveredMethod.
	
	self assert: ((testCases collect: [:each | each selector]) includes:#testCaseThatCoversAClassMethod).

