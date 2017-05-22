private
testCasesFrom: testClasses 
	^ testClasses
		inject: OrderedCollection new
		into: [:testCases :testClass | 
			((testClass isKindOf: TestCase class)
					and: [testClass isAbstract not])
				ifTrue: [testCases addAll: testClass suite tests].
			testCases]