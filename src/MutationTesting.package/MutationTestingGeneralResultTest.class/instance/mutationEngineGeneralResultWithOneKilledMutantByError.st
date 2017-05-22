accessing
mutationEngineGeneralResultWithOneKilledMutantByError
	"Returns a Mutant Engine General Result with only one mutant killed by
	error. "
	^ MutationTestingGeneralResult for: (OrderedCollection with: resource evaluationResultForKilledMutantByError)