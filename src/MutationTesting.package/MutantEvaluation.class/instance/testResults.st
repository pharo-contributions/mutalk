private
testResults 
	^ (LimitedInTimeEvaluation 
		of: [ self runTests]
		toTimeInMiliseconds: (strategy timeoutForTestsOf: self)) value