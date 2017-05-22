accessing-testClasses
testClassList
	| offset ident |
	testClasses isEmpty ifTrue: [ ^ testClasses ].
	offset := testClasses first allSuperclasses size.
	^ testClasses collect: [ :each |
		ident := String 
			new: 2 * (0 max: each allSuperclasses size - offset) 
			withAll: $ .
		ident , each name].