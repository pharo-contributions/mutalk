filtering
filterClasses
	| pattern |
	pattern := UIManager default 
		request: 'Pattern to select Class:' 
		initialAnswer: '*'.
	pattern isNil ifTrue: [ ^ self ].
	classesSelected := (classes select: [ :each | 
		pattern match: each name ]) asSet.
	self changed: #allSelections; changed: #classSelected; changed: #hasRunnable.