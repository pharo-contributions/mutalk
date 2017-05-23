testing
testMutationScoreAcceptable
	|score|
	score := (MutationAcceptableScore scoreFor: self mutationResultAcceptable).
	self assert: score isAcceptableScore.
	self deny: score isNonAcceptableScore.
	self deny: score isAlmostAcceptableScore.