testing
testMutationResultKilledByError
	| result |
	result := resource evaluationResultForKilledMutantByError.
	self assert: result killed.
	self deny: result survived.
	self deny: result terminated.
	self assert: result runCount = 1