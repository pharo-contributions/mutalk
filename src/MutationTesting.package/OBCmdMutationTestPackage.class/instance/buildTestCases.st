execution
buildTestCases

	^target testSuite tests
		inject: OrderedCollection new 
		into: [:collection :suite | collection addAll: suite tests. collection] 
