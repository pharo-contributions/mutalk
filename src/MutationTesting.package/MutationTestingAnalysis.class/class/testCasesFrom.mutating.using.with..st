instance creation
testCasesFrom: testClasses mutating: classes using: operatorCollection with: anEvaluationStrategy
	
	^ self 
		for: (self testCasesFrom: testClasses)
		mutating: classes
		using: operatorCollection
		with: anEvaluationStrategy.