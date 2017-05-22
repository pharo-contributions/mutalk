accessing
allConcreteSubclasses
	^ self allSubclasses reject: [:ea | ea isAbstract]