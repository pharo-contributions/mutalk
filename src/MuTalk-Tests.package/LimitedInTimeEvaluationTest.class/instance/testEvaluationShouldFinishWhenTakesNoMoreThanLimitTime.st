testing
testEvaluationShouldFinishWhenTakesNoMoreThanLimitTime

	|evaluationFinished |
	evaluationFinished := false.
	
	(LimitedInTimeEvaluation of:[(Delay forMilliseconds:100) wait. evaluationFinished := true] toTimeInMiliseconds: 300) value.
	
	self assert: evaluationFinished.