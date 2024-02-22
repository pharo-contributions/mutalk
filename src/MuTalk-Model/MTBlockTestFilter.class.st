Class {
	#name : 'MTBlockTestFilter',
	#superclass : 'MTTestFilter',
	#category : 'MuTalk-Model-Test filters',
	#package : 'MuTalk-Model',
	#tag : 'Test filters'
}

{ #category : 'enumerating' }
MTBlockTestFilter >> filterTests: aTestCaseCollection [

	^ aTestCaseCollection select: condition
]
