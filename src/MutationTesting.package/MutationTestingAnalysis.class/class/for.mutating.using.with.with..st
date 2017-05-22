instance creation
for: testCases mutating: classes using: operatorCollection with: aMutantsEvaluationStrategy with: aMutationsGenerationStrategy 
	^ self 
		for: testCases
		mutating: classes
		using: operatorCollection
		with: aMutantsEvaluationStrategy
		with: aMutationsGenerationStrategy
		loggingIn: self defaultLogger