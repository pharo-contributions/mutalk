Class {
	#name : #MTPragmaSelectionTestFilter,
	#superclass : #MTPragmaTestFilter,
	#category : 'MuTalk-Model-Test filters'
}

{ #category : #enumerating }
MTPragmaSelectionTestFilter >> excludedTestsFrom: aTestCaseCollection [

	^ self rejectPragmaInTestCollection: aTestCaseCollection
]

{ #category : #enumerating }
MTPragmaSelectionTestFilter >> filteredTestsFrom: aTestCaseCollection [

	^ self selectPragmaInTestCollection: aTestCaseCollection
]

{ #category : #accessing }
MTPragmaSelectionTestFilter >> reasonString [

	^ 'Does not contain the pragma <' , condition
]
