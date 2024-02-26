Class {
	#name : #MTPragmaRejectionTestFilter,
	#superclass : #MTPragmaTestFilter,
	#category : 'MuTalk-Model-Test filters'
}

{ #category : #enumerating }
MTPragmaRejectionTestFilter >> filterTests: aTestCaseCollection [

	^ aTestCaseCollection reject: [ :testCaseReference |
		  self isPragmaValidFrom: testCaseReference ]
]
