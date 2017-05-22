initialize-release
initializeFor: someTestCasesReferences mutating: someModelClasses using: operatorCollection with: aMutantsEvaluationStrategy with: aMutationsGenerationStrategy loggingIn: aLogger 
	modelClasses := someModelClasses.
	testCases := someTestCasesReferences.
	operators := operatorCollection.
	mutationsGenerationStrategy := aMutationsGenerationStrategy.
	mutantsEvaluationStrategy := aMutantsEvaluationStrategy.
	particularResults := OrderedCollection new.
	elapsedTime := 0.
	logger := aLogger