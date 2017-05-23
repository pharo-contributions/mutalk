accessing-classes
selectNoClasses
	classesSelected := Set new.
	self changed: #allSelections; changed: #classSelected; changed: #hasRunnable.