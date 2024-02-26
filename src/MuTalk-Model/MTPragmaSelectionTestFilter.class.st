Class {
	#name : #MTPragmaSelectionTestFilter,
	#superclass : #MTPragmaTestFilter,
	#category : 'MuTalk-Model-Test filters'
}

{ #category : #enumerating }
MTPragmaSelectionTestFilter >> filterTests: aTestCaseCollection [

	^ aTestCaseCollection select: [ :testCaseReference |
		  self isPragmaValidFrom: testCaseReference ]
]
