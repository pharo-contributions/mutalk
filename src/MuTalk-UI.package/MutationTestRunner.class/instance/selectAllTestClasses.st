accessing-testClasses
selectAllTestClasses
	testClassesSelected := testClasses asSet.
	self changed: #allSelections; changed: #testClassSelected; changed: #hasRunnable.