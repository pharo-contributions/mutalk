accessing
terminatedMutants
	^ particularResults select: [ :evaluationResult | evaluationResult terminated ]