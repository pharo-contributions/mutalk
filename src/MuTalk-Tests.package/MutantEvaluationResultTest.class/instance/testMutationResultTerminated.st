testing
testMutationResultTerminated
	| result |
	result := resource evaluationResultForTerminatedMutant.
	self deny: result killed.
	self deny: result survived.
	self assert: result terminated.
	self assert: result runCount = 0