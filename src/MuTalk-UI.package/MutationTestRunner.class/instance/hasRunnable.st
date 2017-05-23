testing
hasRunnable
	^ classesSelected notEmpty
		and: [testClassesSelected notEmpty
				and: [mutationOperatorsSelected notEmpty]]