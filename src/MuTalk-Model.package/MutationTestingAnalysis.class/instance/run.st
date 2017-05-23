running
run
	"Obtain mutants applying the operators in the classes (or
	methods of
	those classes) and execute all mutants in the set of testClases.
	We obtain a result for each mutant generated"
	^[testCases do: [ :aTestCase | aTestCase run ].
	logger logAnalysisStartFor:self.
	elapsedTime := Time millisecondsToRun: [
					self generateCoverageAnalysis.
					self generateMutations.
					self generateResults.].
					true]
						on: TestsWithErrorsException
						do: [:ex | 
							OBInformRequest message: 'Your tests have Errors or Failures. Please correct them.'.
							ex return: false]