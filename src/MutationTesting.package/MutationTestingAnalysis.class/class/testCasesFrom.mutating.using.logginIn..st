instance creation
testCasesFrom: testClasses mutating: classes using: operatorCollection logginIn: aLogger 
	^ self 
		for: (self testCasesFrom: testClasses)
		mutating: classes
		using: operatorCollection
		loggingIn: aLogger