testing
testMutationResultSurvived
	"Test the creation of a Mutant Result that survived"
	| result |
	result := resource evaluationResultForAliveMutant.
	self deny: result killed.
	self assert: result survived.
	self deny: result terminated.
	self assert: result runCount = 1