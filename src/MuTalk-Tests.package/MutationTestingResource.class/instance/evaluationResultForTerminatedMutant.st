building
evaluationResultForTerminatedMutant
	"Build a MutationEvaluationResult for aMutant terminated"
	| mutation |
	mutation := self mutation.
	^ MutantEvaluationResult 
		for: mutation
		results: nil