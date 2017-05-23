testing
testMutationResultKilledByFailure
	| result |
	result := resource evaluationResultForKilledMutantByFailure.
	self assert: result killed.
	self deny: result survived.
	self deny: result terminated.
	self assert: result runCount = 1