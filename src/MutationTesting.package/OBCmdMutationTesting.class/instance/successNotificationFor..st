execution
successNotificationFor: result
		
	(result generalResult numberOfEvaluatedMutants = 0)
		ifTrue: [OBInformRequest message: 'No mutations founds']
		ifFalse: [MutationTestingAnalysisResultBrowser openOn: result.]	
		
	