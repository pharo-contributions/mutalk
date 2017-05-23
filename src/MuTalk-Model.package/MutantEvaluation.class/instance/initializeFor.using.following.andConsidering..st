initialize-release
initializeFor: aMutation using:aCollectionOftestCases following: aMutantEvaluationStrategy andConsidering: aCoverageAnalysisResult
	mutation := aMutation.
	testCases := aCollectionOftestCases.
	strategy := aMutantEvaluationStrategy.
	coverageAnalysisResult := aCoverageAnalysisResult	