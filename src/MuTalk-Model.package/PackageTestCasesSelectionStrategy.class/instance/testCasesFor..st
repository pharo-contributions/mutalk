selecting
testCasesFor: aTestCollection 
	| testsPackage |
	testsPackage := self testPackageFrom: aTestCollection.
	^ testsPackage 
		inject: OrderedCollection new
		into: 
			[ :resultTests :testPackage | 
			(self testClassesFromPackage: testPackage) do: [ :testClass | resultTests addAll: testClass suite tests ].
			resultTests ]