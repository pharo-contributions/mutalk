instance creation
testCasesReferencesFrom: testClass 
	^ testClass allTestSelectors collect: 
		[ :each | 
		TestCaseReference 
			for: each
			in: testClass ]