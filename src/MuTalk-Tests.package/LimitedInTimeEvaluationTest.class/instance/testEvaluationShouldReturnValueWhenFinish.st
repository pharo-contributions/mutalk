testing
testEvaluationShouldReturnValueWhenFinish

	|value|
	value := (LimitedInTimeEvaluation of:[5] toTimeInMiliseconds: 300) value.
	
	self assert: value = 5.