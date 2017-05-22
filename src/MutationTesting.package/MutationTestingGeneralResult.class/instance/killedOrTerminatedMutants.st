accessing
killedOrTerminatedMutants
	^ particularResults select: [ :evaluationResult | evaluationResult killed or: [ evaluationResult terminated ] ]