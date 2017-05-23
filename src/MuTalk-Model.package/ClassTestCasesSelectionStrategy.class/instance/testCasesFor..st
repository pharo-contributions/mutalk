selecting
testCasesFor: aTestCollection 
	"Returns all tests in testClases from a collection of tests."
	
	| testClasses |
	testClasses := self testClassesFrom: aTestCollection.
	^ testClasses 
		inject: OrderedCollection new
		into: 
			[ :resultTests :testClass | 
			resultTests addAll: testClass suite tests.
			resultTests ]