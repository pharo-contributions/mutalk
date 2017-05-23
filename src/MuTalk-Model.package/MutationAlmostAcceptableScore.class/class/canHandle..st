instance creation
canHandle: aMutationTestingGeneralResult
	| score |
	score := aMutationTestingGeneralResult mutationScore.
	^ score between: 50 and: 80