accessing-classes
selectInverseClasses
	classesSelected := classes asSet 
		removeAll: classesSelected;
		yourself.
	self changed: #allSelections; changed: #classSelected; changed: #hasRunnable.