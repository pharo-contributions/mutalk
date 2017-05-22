instance creation
testCasesFrom: testClasses mutating: classes using: operatorCollection with: anEvaluationStrategy loggingIn: aLogger
	
	^ self 
		for: (self testCasesFrom: testClasses)
		mutating: classes
		using: operatorCollection
		with: anEvaluationStrategy 
		loggingIn: aLogger.