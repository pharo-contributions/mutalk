building
evaluationResultForKilledMutantByError
	"Build a MutationEvaluationResult for aMutant with only one Error"
	| mutation testResultWithOneError |
	mutation := self mutation.
	testResultWithOneError := self testResultWithError.
	^ MutantEvaluationResult 
		for: mutation
		results: testResultWithOneError