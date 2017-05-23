testing
testAccessorsWithOnlyOneKilledMutantByFailure
	"Build a MutationEngineGeneralResult with only 1 killed mutant by failure."
	| mutantResult |
	mutantResult := self mutationEngineGeneralResultWithOneKilledMutantByFailure.
	self assert: mutantResult numberOfEvaluatedMutants = 1.
	self assert: mutantResult numberOfKilledMutants = 1.
	self assert: mutantResult numberOfAliveMutants = 0.
	self assert: mutantResult numberOfTerminatedMutants = 0.
	self assert: mutantResult mutationScore = 100.
	self deny: mutantResult isNonAcceptableScore.
	self assert: mutantResult isAcceptableScore