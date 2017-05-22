execution
execute
	| executionAnalisys |
	executionAnalisys := MutationTestingAnalysis
		for: self buildTestCasesReferences
		mutating: self packageClasses
		using: self mutantsOperators
		with: SelectingFromCoverageMutantEvaluationStrategy new
		with: SelectingFromCoverageMutationsGenerationStrategy new.
		
	executionAnalisys run ifTrue:[self successNotificationFor: executionAnalisys]
	
	