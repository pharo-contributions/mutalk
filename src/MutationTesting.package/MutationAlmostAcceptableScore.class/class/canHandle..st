instance creation
canHandle: aMutationTestingGeneralResult 
	|score|
	score := aMutationTestingGeneralResult mutationScore. 
	^score <= 80 and: [score >= 50]