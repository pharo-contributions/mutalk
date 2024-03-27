Class {
	#name : #MTTimeTestFilter,
	#superclass : #MTTestFilter,
	#instVars : [
		'maxDuration'
	],
	#category : 'MuTalk-Model-Test filters'
}

{ #category : #accessing }
MTTimeTestFilter >> condition: aMaxDuration [

	self maxDuration: aMaxDuration
]

{ #category : #enumerating }
MTTimeTestFilter >> excludedTestsFrom: aTestCaseCollection [

	^ aTestCaseCollection reject: [ :testCaseReference |
		  testCaseReference lastTimeToRun <= maxDuration ]
]

{ #category : #accessing }
MTTimeTestFilter >> filteredTestReason [ 

	^ 'Took longer than ', maxDuration printString, ' to run'
]

{ #category : #enumerating }
MTTimeTestFilter >> filteredTestsFrom: aTestCaseCollection [

	^ aTestCaseCollection select: [ :testCaseReference |
		  testCaseReference lastTimeToRun <= maxDuration ]
]

{ #category : #accessing }
MTTimeTestFilter >> maxDuration [

	^ maxDuration
]

{ #category : #accessing }
MTTimeTestFilter >> maxDuration: anObject [

	maxDuration := anObject
]
