running
generateResults
	particularResults := OrderedCollection new.
	mutations
		do: [:aMutation | logger logStartEvaluating: aMutation. 
			particularResults add: (MutantEvaluation
					for: aMutation
					using: testCases
					following: mutantsEvaluationStrategy
					andConsidering: self coverageAnalysisResult) value]
		displayingProgress: 'Evaluating mutants'.
	^ particularResults