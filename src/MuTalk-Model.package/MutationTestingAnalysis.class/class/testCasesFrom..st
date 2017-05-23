instance creation
testCasesFrom: testClasses 
	^ testClasses
		inject: OrderedCollection new
		into: [:testCases :testClass | 
			((testClass isKindOf: TestCase class)
					and: [testClass isAbstract not])
				ifTrue: [testCases
						addAll: (self testCasesReferencesFrom: testClass)].
			testCases]