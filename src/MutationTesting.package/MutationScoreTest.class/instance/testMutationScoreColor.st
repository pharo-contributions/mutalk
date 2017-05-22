testing
testMutationScoreColor
	|score|
	score := (MutationScoreBehavior buildFor: self mutationResultAcceptable).
	self assert: score color = Color green.
	
	score := (MutationScoreBehavior buildFor: self mutationResultNonAcceptable).
	self assert: score color = Color red.
	
	score := (MutationScoreBehavior buildFor: self mutationResultAlmostAcceptable).
	self assert: score color = Color yellow.