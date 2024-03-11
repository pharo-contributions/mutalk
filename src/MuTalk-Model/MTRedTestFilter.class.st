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
		  testCase lastResult failures isEmpty and: [
			  testCase lastResult unexpectedErrorCount = 0 ] ]
]
