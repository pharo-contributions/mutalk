instance creation
for: testCases mutating: classes using: operatorCollection loggingIn: aLogger 
	^ self 
		for: testCases
		mutating: classes
		using: operatorCollection
		with: self defaultMutantsEvaluationStrategy
		with: self defaultMutationsGenerationStrategy
		loggingIn: aLogger