execution
buildTestCasesReferences
		
	^self buildTestCases collect: [:test | TestCaseReference 
			for: test selector
			in: test class]