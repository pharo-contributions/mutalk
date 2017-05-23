building
evaluationResultForKilledMutantByFailure
	"Build a MutationEvaluationResult for aMutant with only one Failure"
	| mutation testResultWithOneFailure |
	mutation := self mutation.
	testResultWithOneFailure := self testResultWithFailure.
	^ MutantEvaluationResult 
		for: mutation
		results: testResultWithOneFailure