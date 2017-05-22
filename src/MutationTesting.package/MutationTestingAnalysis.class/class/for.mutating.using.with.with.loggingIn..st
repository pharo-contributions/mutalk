instance creation
for: testCases mutating: classes using: operatorCollection with: aMutantsEvaluationStrategy with: aMutationsGenerationStrategy loggingIn: aLogger 
	^ self new
		initializeFor: testCases
			mutating: classes
			using: operatorCollection
			with: aMutantsEvaluationStrategy
			with: aMutationsGenerationStrategy
			loggingIn: aLogger;
		yourself