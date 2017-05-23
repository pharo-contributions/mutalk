private
suiteAllMutantAndAllTests
	^ MutationTestingAnalysis
		testCasesFrom: testClassesSelected
		mutating: classesSelected
		using: mutationOperatorsSelected
		with: AllTestsMethodsRunningMutantEvaluationStrategy new
		loggingIn: self logger