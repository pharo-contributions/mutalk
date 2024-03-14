Class {
	#name : 'MTPragmaRejectionTestFilter',
	#superclass : 'MTPragmaTestFilter',
	#category : 'MuTalk-Model-Test filters',
	#package : 'MuTalk-Model',
	#tag : 'Test filters'
}

{ #category : 'enumerating' }
MTPragmaRejectionTestFilter >> excludedTestsFrom: aTestCaseCollection [

	^ self selectPragmaInTestCollection: aTestCaseCollection
]

{ #category : 'enumerating' }
MTPragmaRejectionTestFilter >> filteredTestsFrom: aTestCaseCollection [

	^ self rejectPragmaInTestCollection: aTestCaseCollection
]

{ #category : 'accessing' }
MTPragmaRejectionTestFilter >> reasonString [

	^ 'Contains the pragma <' , condition
]
