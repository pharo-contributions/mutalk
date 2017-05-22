accessing-testClasses
testClassAt: anInteger

	^ testClassesSelected includes: (testClasses at: anInteger ifAbsent: [ ^ false ]).