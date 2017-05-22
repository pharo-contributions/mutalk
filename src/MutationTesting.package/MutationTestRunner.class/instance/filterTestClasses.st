filtering
filterTestClasses
	| pattern |
	pattern := UIManager default 
		request: 'Pattern to select tests classes:' 
		initialAnswer: '*'.
	pattern isNil ifTrue: [ ^ self ].
	testClassesSelected := (testClasses select: [ :each | 
		pattern match: each name ]) asSet.
	self changed: #allSelections; changed: #testClassSelected; changed: #hasRunnable.