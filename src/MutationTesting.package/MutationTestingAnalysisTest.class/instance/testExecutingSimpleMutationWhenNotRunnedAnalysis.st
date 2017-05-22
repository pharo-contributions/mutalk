testing
testExecutingSimpleMutationWhenNotRunnedAnalysis
	| analysis results generalResult |
	analysis := MutationTestingAnalysis 
		testCasesFrom: (Array with: AuxiliarClassForMutationTestingAnalysisTest)
		mutating: (Array with: AuxiliarClassForMutationTestingAnalysis)
		using: self plusForMinusReplacementMutation.
	"analysis run."
	generalResult := analysis generalResult.
	results := analysis particularResults.
	self assert: results size = 0.
	self assert: generalResult numberOfEvaluatedMutants = 0