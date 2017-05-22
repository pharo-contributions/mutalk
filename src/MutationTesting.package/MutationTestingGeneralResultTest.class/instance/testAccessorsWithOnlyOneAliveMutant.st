testing
testAccessorsWithOnlyOneAliveMutant
	"Build a MutationEngineGeneralResult with only 1 alive mutant."
	| mutantResult |
	mutantResult := self mutationEngineGeneralResultWithOneAliveMutant.
	self assert: mutantResult numberOfEvaluatedMutants = 1.
	self assert: mutantResult numberOfKilledMutants = 0.
	self assert: mutantResult numberOfAliveMutants = 1.
	self assert: mutantResult numberOfTerminatedMutants = 0.
	self assert: mutantResult mutationScore = 0.
	self assert: mutantResult isNonAcceptableScore.
	self deny: mutantResult isAcceptableScore