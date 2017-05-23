testing
testMutationScoreNonAcceptable
	|score|
	score := (MutationNonAcceptableScore scoreFor: self mutationResultNonAcceptable).
	self deny: score isAcceptableScore.
	self assert: score isNonAcceptableScore.
	self deny: score isAlmostAcceptableScore.