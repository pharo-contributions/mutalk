instance creation
newFor: aMutant results: aTestResult producedBy: aMutantEvaluation 
	^ self new
		initializeFor: aMutant
			results: aTestResult
			producedBy: aMutantEvaluation;
		yourself