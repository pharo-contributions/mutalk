accessing-testClasses
selectNoTestClasses
	testClassesSelected := Set new.
	self changed: #allSelections; changed: #testClassSelected; changed: #hasRunnable.