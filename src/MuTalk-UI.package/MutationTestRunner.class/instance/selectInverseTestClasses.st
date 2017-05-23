accessing-testClasses
selectInverseTestClasses
	testClassesSelected := testClasses asSet 
		removeAll: testClassesSelected;
		yourself.
	self changed: #allSelections; changed: #testClassSelected; changed: #hasRunnable.