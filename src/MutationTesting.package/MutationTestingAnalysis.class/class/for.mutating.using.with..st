instance creation
for: testCases mutating: classes using: operatorCollection with: aMutantEvaluationStrategy
	
	^ self 
		for: testCases
		mutating: classes
		using: operatorCollection
		with: aMutantEvaluationStrategy
		with: self defaultMutationsGenerationStrategy