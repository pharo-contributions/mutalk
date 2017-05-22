accessing
mutationEngineGeneralResultWithOneTerminatedMutant
	"Returns a Mutant Engine General Result with only one terminated mutant."
	^ MutationTestingGeneralResult for: (OrderedCollection with: resource evaluationResultForTerminatedMutant)