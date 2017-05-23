private
suiteAllMutantAndCoveredTests
	^ MutationTestingAnalysis
		testCasesFrom: testClassesSelected
		mutating: classesSelected
		using: mutationOperatorsSelected
		with: SelectingFromCoverageMutantEvaluationStrategy new
		loggingIn: self logger