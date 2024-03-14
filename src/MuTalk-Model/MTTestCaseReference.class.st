Class {
	#name : 'MTTestCaseReference',
	#superclass : 'Object',
	#instVars : [
		'testCase',
		'lastTimeToRun',
		'lastResult'
	],
	#category : 'MuTalk-Model-Core',
	#package : 'MuTalk-Model',
	#tag : 'Core'
}

{ #category : 'instance creation' }
MTTestCaseReference class >> for: aTestCase [

	^ self new initializeFor: aTestCase
]

{ #category : 'comparing' }
MTTestCaseReference >> = anObject [

	self == anObject ifTrue: [ ^ true ].
	anObject species = self class ifFalse: [ ^ false ].
	self testCaseClass = anObject testCaseClass ifFalse: [ ^ false ].
	^ self selector = anObject selector
]

{ #category : 'comparing' }
MTTestCaseReference >> hash [

	^ testCase selector hash + testCase class hash
]

{ #category : 'initialize' }
MTTestCaseReference >> initializeFor: aTestCase [

	testCase := aTestCase
]

{ #category : 'accessing' }
MTTestCaseReference >> lastResult [

	^ lastResult
]

{ #category : 'accessing' }
MTTestCaseReference >> lastResult: anObject [

	lastResult := anObject
]

{ #category : 'accessing' }
MTTestCaseReference >> lastTimeToRun [

	^ lastTimeToRun
]

{ #category : 'accessing' }
MTTestCaseReference >> method [

	^ testCase class >> testCase selector
]

{ #category : 'printing' }
MTTestCaseReference >> printOn: aStream [

	aStream nextPutAll: (aStream print: testCase)
]

{ #category : 'evaluating' }
MTTestCaseReference >> resources [

	^ testCase resources
]

{ #category : 'evaluating' }
MTTestCaseReference >> run [

	lastTimeToRun := [ lastResult := self testCase run ] timeToRun.
	^ lastResult
]

{ #category : 'evaluating' }
MTTestCaseReference >> run: aTestResult [

	^ testCase run: aTestResult
]

{ #category : 'accessing' }
MTTestCaseReference >> selector [

	^ testCase selector
]

{ #category : 'evaluating' }
MTTestCaseReference >> testCase [

	^ testCase
]

{ #category : 'accessing' }
MTTestCaseReference >> testCaseClass [

	^ testCase class
]
