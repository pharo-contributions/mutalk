accessing
mutationEngineGeneralResultWithOneAliveMutant
	"Returns a Mutant Engine General Result with only one mutant survived."
	^ MutationTestingGeneralResult for: (OrderedCollection with: resource evaluationResultForAliveMutant)