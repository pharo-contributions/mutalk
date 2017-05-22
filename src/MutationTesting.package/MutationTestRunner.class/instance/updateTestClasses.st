updating
updateTestClasses
	| testClassesForCategories |
	testClassesForCategories := self findTestClassesForCategories: categoriesSelected.
	testClasses := testClassesForCategories asArray
				sort: [:a :b | self sortClass: a before: b].
	testClassesSelected := testClassesSelected isNil
				ifTrue: [testClassesForCategories]
				ifFalse: [testClassesSelected
						select: [:each | testClassesForCategories includes: each]].
	self changed: #allSelections;
		 changed: #testClassList;
		 changed: #testClassSelected;
		 changed: #hasRunnable