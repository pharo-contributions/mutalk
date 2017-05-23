private
suiteCoveredMutantAndCoveredTests
	^ MutationTestingAnalysis 
		testCasesFrom: testClassesSelected
		mutating: classesSelected
		using: mutationOperatorsSelected
		with: SelectingFromCoverageMutantEvaluationStrategy new
		with: SelectingFromCoverageMutationsGenerationStrategy new
		loggingIn: self logger