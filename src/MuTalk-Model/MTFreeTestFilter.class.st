Class {
	#name : #MTFreeTestFilter,
	#superclass : #MTTestFilter,
	#category : 'MuTalk-Model-Test filters'
}

{ #category : #enumerating }
MTFreeTestFilter >> excludedTestsFrom: aTestCaseCollection [

	^ OrderedCollection empty
]

{ #category : #accessing }
MTFreeTestFilter >> filteredTestReason [

	^ 'Not filtered'
]

{ #category : #enumerating }
MTFreeTestFilter >> filteredTestsFrom: aTestCaseCollection [

	^ aTestCaseCollection
]
