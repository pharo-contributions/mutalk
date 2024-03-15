Class {
	#name : #MTTimeTestFilter,
	#superclass : #MTTestFilter,
	#category : 'MuTalk-Model-Test filters'
}

{ #category : #enumerating }
MTTimeTestFilter >> excludedTestsFrom: aTestCaseCollection [

	^ aTestCaseCollection reject: [ :testCaseReference |
		  testCaseReference lastTimeToRun <= condition ]
]

{ #category : #accessing }
MTTimeTestFilter >> filteredTestReason [ 

	^ 'Took longer than ', condition printString, ' to run'
]

{ #category : #enumerating }
MTTimeTestFilter >> filteredTestsFrom: aTestCaseCollection [

	^ aTestCaseCollection select: [ :testCaseReference |
		  testCaseReference lastTimeToRun <= condition ]
]
