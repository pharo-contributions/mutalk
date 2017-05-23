private
suiteCoveredMutantAndAllTests
	^ MutationTestingAnalysis
		testCasesFrom: testClassesSelected
		mutating: classesSelected
		using: mutationOperatorsSelected
		with: AllTestsMethodsRunningMutantEvaluationStrategy new
		with: SelectingFromCoverageMutationsGenerationStrategy new
		loggingIn: self logger