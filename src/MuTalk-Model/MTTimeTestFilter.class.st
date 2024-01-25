Class {
	#name : 'MTTimeTestFilter',
	#superclass : 'MTTestFilter',
	#category : 'MuTalk-Model-Test filters',
	#package : 'MuTalk-Model',
	#tag : 'Test filters'
}

{ #category : 'enumerating' }
MTTimeTestFilter >> filterTests: aTestCaseCollection [

	^ aTestCaseCollection select: [ :testCaseReference |
		  testCaseReference lastTimeToRun <= condition ]
]
