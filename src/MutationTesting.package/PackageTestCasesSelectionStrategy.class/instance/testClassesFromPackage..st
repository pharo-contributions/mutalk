selecting
testClassesFromPackage: aPackageName 
	^ (aPackageName asPackage) classes select: [ :class | self isClassTest: class ]