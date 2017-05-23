instance creation
testCasesFrom: testClasses mutating: classes using: operatorCollection with: anEvaluationStrategy with: aGenerationStrategy loggingIn: aLogger 
	^ self 
		for: (self testCasesFrom: testClasses)
		mutating: classes
		using: operatorCollection
		with: anEvaluationStrategy
		with: aGenerationStrategy
		loggingIn: aLogger