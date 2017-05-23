accessing-testClasses
testClassAt: anInteger put: aBoolean 

	testClassesSelected := testClassesSelected
				perform: (aBoolean
						ifTrue: [#copyWith:]
						ifFalse: [#copyWithout:])
				with: (testClasses
						at: anInteger
						ifAbsent: [^ self]).
	self changed: #testClassSelected;
		 changed: #hasRunnable.