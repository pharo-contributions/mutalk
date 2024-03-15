Class {
	#name : #MTBlockTestFilter,
	#superclass : #MTTestFilter,
	#category : 'MuTalk-Model-Test filters'
}

{ #category : #enumerating }
MTBlockTestFilter >> excludedTestsFrom: aTestCaseCollection [

	^ aTestCaseCollection reject: condition
]

{ #category : #accessing }
MTBlockTestFilter >> filteredTestReason [ 

	^ 'Took longer than ', condition printString, ' to run'
]

{ #category : #enumerating }
MTBlockTestFilter >> filteredTestsFrom: aTestCaseCollection [

	^ aTestCaseCollection select: condition
]
