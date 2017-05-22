testing
testAccessorsWithOnlyOneTerminatedMutant
	"Build a MutationEngineGeneralResult with only 1 terminated mutant."
	| mutantResult |
	mutantResult := self mutationEngineGeneralResultWithOneTerminatedMutant.
	self assert: mutantResult numberOfEvaluatedMutants = 1.
	self assert: mutantResult numberOfKilledMutants = 0.
	self assert: mutantResult numberOfAliveMutants = 0.
	self assert: mutantResult numberOfTerminatedMutants = 1.
	self assert: mutantResult mutationScore = 100.
	self assert: mutantResult isAcceptableScore.
	self deny: mutantResult isNonAcceptableScore