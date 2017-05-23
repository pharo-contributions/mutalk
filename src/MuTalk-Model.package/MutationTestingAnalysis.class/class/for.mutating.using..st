instance creation
for: testCases mutating: classes using: operatorCollection 	
	^ self 
		for: testCases
		mutating: classes
		using: operatorCollection
		with: self defaultMutantsEvaluationStrategy
		with: self defaultMutationsGenerationStrategy