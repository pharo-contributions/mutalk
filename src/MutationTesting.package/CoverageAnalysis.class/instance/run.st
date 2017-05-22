evaluating
run
	| wrappers methodReferences |
	methodReferences := self methodReferences.
	wrappers := self methodWrappersFor: methodReferences.
	self runTestsInstalling: wrappers.
	result := CoverageAnalysisResult from: (self methodToTestDictionaryFrom: wrappers) elapsedTime: testRunningElapsedTime