testing
testMutationScoreAlmostAcceptable
	|score|
	score := (MutationAlmostAcceptableScore scoreFor: self mutationResultAlmostAcceptable).
	self deny: score isAcceptableScore.
	self deny: score isNonAcceptableScore.
	self assert: score isAlmostAcceptableScore.