testing
testEvaluationShouldBeTerminatedWhenTakesMoreThanLimitTime

	|evaluationFinished |
	evaluationFinished := false.
	
	(LimitedInTimeEvaluation of:[(Delay forMilliseconds:500) wait. evaluationFinished := true] toTimeInMiliseconds: 100) value.
	
	self deny: evaluationFinished.