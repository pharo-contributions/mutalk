accessing
mutationEngineGeneralResultWithOneKilledMutantByFailure
	"Returns a Mutant Engine General Result with only one mutant killed by
	failure."
	^ MutationTestingGeneralResult for: (OrderedCollection with: resource evaluationResultForKilledMutantByFailure)