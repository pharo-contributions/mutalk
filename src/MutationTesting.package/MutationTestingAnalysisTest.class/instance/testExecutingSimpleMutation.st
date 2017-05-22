testing
testExecutingSimpleMutation
	| analysis results generalResult mutationResult |
	analysis := MutationTestingAnalysis 
		testCasesFrom: (Array with: AuxiliarClassForMutationTestingAnalysisTest)
		mutating: (Array with: AuxiliarClassForMutationTestingAnalysis)
		using: self plusForMinusReplacementMutation.
	analysis run.
	generalResult := analysis generalResult.
	results := analysis particularResults.
	self assert: results size = 1.
	mutationResult := results first.
	self assert: mutationResult killed.
	self assert: generalResult numberOfKilledMutants = 1