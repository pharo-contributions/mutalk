building
evaluationResultForAliveMutant
	"Build a MutationEvaluationResult for aMutant with only one survived"
	| mutation testResultWithoutErrors |
	mutation := self mutation.
	testResultWithoutErrors := self testResultWithoutErrorOrFailure.
	^ MutantEvaluationResult 
		for: mutation
		results: testResultWithoutErrors