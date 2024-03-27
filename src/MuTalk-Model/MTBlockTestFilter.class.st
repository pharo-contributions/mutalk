Class {
	#name : #MTBlockTestFilter,
	#superclass : #MTTestFilter,
	#instVars : [
		'conditionBlock'
	],
	#category : 'MuTalk-Model-Test filters'
}

{ #category : #accessing }
MTBlockTestFilter >> condition: aConditionBlock [

	self conditionBlock: aConditionBlock
]

{ #category : #accessing }
MTBlockTestFilter >> conditionBlock [

	^ conditionBlock
]

{ #category : #accessing }
MTBlockTestFilter >> conditionBlock: anObject [

	conditionBlock := anObject
]

{ #category : #enumerating }
MTBlockTestFilter >> excludedTestsFrom: aTestCaseCollection [

	^ aTestCaseCollection reject: conditionBlock
]

{ #category : #accessing }
MTBlockTestFilter >> filteredTestReason [

	^ 'Did not respect the block condition: '
	  , conditionBlock printString
]

{ #category : #enumerating }
MTBlockTestFilter >> filteredTestsFrom: aTestCaseCollection [

	^ aTestCaseCollection select: conditionBlock
]
