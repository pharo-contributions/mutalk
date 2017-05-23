testing
loggedStartMutantEvaluationForMutationOf: aCompiledMethod 
	^ loggedEvaluationMutations
		anySatisfy: [:aMutation | aMutation originalMethod = aCompiledMethod]