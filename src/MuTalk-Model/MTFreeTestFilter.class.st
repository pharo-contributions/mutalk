Class {
	#name : 'MTFreeTestFilter',
	#superclass : 'MTTestFilter',
	#category : 'MuTalk-Model-Test filters',
	#package : 'MuTalk-Model',
	#tag : 'Test filters'
}

{ #category : 'enumerating' }
MTFreeTestFilter >> filterTests: aTestCaseCollection [

	^ aTestCaseCollection
]

{ #category : 'accessing' }
MTFreeTestFilter >> filteredTestReason [

	^ 'Not filtered'
]
