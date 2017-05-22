building
evaluationResultEmpty
	"Build a MutationEvaluationResult empty"
	| mutant testResultEmpty |
	mutant := self mutation.
	testResultEmpty := self testResultEmpty.
	^ MutantEvaluationResult 
		for: mutant
		results: testResultEmpty