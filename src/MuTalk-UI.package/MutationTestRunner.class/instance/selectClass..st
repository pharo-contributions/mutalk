accessing-classes
selectClass: aClass
	self classAt: (classes indexOf: aClass) put: true.