instance creation
for: testCases mutating: classes using: operatorCollection with: aMutantEvaluationStrategy loggingIn: aLogger
	
	^ self 
		for: testCases
		mutating: classes
		using: operatorCollection
		with: aMutantEvaluationStrategy
		with: self defaultMutationsGenerationStrategy
		loggingIn: aLogger