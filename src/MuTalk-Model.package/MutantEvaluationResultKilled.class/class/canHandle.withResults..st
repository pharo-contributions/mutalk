instance creation
canHandle: aMutant withResults: aTestResult

 	^aTestResult notNil and:[aTestResult errorsSize + aTestResult failuresSize > 0]
	