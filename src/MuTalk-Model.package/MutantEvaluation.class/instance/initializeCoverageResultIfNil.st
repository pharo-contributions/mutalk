initialize-release
initializeCoverageResultIfNil
	coverageAnalysisResult 
		ifNil:[ |coverageAnalysis|
				coverageAnalysis := CoverageAnalysis for: (OrderedCollection with: mutation originalClass)
															 running: testCases. 
				coverageAnalysisResult := coverageAnalysis run;result].