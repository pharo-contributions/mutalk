Class {
	#name : 'MTRedTestFilter',
	#superclass : 'MTTestFilter',
	#category : 'MuTalk-Model-Test filters',
	#package : 'MuTalk-Model',
	#tag : 'Test filters'
}

{ #category : 'enumerating' }
MTRedTestFilter >> filterTests: aTestCaseCollection [

	^ aTestCaseCollection select: [ :testCase |
		  testCase lastResult unexpectedFailureCount = 0 and: [
			  testCase lastResult unexpectedErrorCount = 0 ] ]
]
