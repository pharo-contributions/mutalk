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

{ #category : 'accessing' }
MTBlockTestFilter >> filteredTestReason [ 

	^ 'Took longer than ', condition printString, ' to run'
]
