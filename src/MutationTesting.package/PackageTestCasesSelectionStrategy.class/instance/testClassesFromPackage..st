selecting
testClassesFromPackage: aPackageName 
	^ (PackageInfo named: aPackageName) classes select: [ :class | self isClassTest: class ]