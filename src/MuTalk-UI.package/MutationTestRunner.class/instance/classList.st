accessing-classes
classList
	| offset ident |
	classes isEmpty ifTrue: [ ^ classes ].
	offset := classes first allSuperclasses size.
	^ classes collect: [ :each |
		ident := String 
			new: 2 * (0 max: each allSuperclasses size - offset) 
			withAll: $ .
		ident , each name].