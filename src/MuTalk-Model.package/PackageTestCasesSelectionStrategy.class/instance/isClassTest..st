selecting
isClassTest: aClass 
	^ self testBaseClasses
		anySatisfy: [:class | aClass includesBehavior: class]