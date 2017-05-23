accessing
aliveMutants
	^ particularResults select: [ :evaluationResult | evaluationResult survived ]