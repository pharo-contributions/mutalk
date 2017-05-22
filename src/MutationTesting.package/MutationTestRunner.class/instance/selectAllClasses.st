accessing-classes
selectAllClasses
	classesSelected := classes asSet.
	self changed: #allSelections; changed: #classSelected; changed: #hasRunnable.