filtering
filterParticularResultsList
	^ self 
		filter: mutantEvaluationResult particularResults
		with: particularResultsClassFilter