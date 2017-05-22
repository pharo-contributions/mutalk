testing
testCoveredMethods
	| analysis |
	analysis := CoverageAnalysis 
		for: (Array with: ClassForTestingCoverage)
		running: TestClassForTestingCoverage suite tests.
	analysis run.
	
	self assert: (analysis result coveredMethods includes: ClassForTestingCoverage >> #aCoveredMethod).
	self deny: (analysis result coveredMethods includes: ClassForTestingCoverage >> #anUncoveredMethod)