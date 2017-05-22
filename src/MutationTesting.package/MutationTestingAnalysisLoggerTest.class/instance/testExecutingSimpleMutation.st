testing
testExecutingSimpleMutation
	| analysis logger operator |
	logger := MockMutationTestingAnalysisLogger new.
	operator := ReplacePlusWithMinusMutantOperator new.
	analysis := MutationTestingAnalysis
				testCasesFrom: (Array with: AuxiliarClassForMutationTestingAnalysisTest)
				mutating: (Array with: AuxiliarClassForMutationTestingAnalysis)
				using: (Array with:operator)
				logginIn: logger.
	analysis run.
	self assert: logger loggedStartAnalysis.
	self
		assert: (logger loggedStartBuildingMutationsFor: AuxiliarClassForMutationTestingAnalysis >> #methodWithOnePlusSender using: operator).
	self assert: (logger loggedStartMutantEvaluationForMutationOf: (AuxiliarClassForMutationTestingAnalysis >> #methodWithOnePlusSender))