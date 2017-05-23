testing
testMutationScoreCreation
	|score|
	score := (MutationScoreBehavior buildFor: self mutationResultAcceptable).
	self assert: score isAcceptableScore.
	score := (MutationScoreBehavior buildFor: self mutationResultAlmostAcceptable).
	self assert: score isAlmostAcceptableScore.
	score := (MutationScoreBehavior buildFor: self mutationResultNonAcceptable).
	self assert: score isNonAcceptableScore.