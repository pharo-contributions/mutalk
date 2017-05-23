private
runTests
	|suite|
	testRunningElapsedTime := Time millisecondsToRun: 
		[suite := TestSuiteWrappedForCoverage for:self named: 'Test Suite for Coverage'.
		 suite addTests: testCases.
	    suite run ].