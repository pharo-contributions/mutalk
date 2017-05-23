instance creation
testCasesFrom: testClasses mutating: classes using: operatorCollection 
	
	^ self 
		for: (self testCasesFrom: testClasses)
		mutating: classes
		using: operatorCollection.