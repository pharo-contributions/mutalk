instance creation
testCasesFrom: testClasses mutating: classes using: operatorCollection with: anEvaluationStrategy with: aGenerationStrategy
	
	^ self 
		for: (self testCasesFrom: testClasses)
		mutating: classes
		using: operatorCollection
		with: anEvaluationStrategy
		with: aGenerationStrategy.