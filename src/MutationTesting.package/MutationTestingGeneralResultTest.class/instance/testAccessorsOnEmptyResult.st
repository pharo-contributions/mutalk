testing
testAccessorsOnEmptyResult
	"Test the accessors methods for an empty result set"
	| emptyResult |
	emptyResult := self mutationEngineGeneralEmptyResult.
	self assert: emptyResult numberOfEvaluatedMutants = 0.
	self assert: emptyResult numberOfKilledMutants = 0.
	self assert: emptyResult numberOfAliveMutants = 0.
	self assert: emptyResult numberOfTerminatedMutants = 0.
	self assert: emptyResult mutationScore = 0.
	self assert: emptyResult isNonAcceptableScore.
	self deny: emptyResult isAcceptableScore