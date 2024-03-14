Class {
	#name : 'MTTestCaseReference',
	#superclass : 'Object',
	#instVars : [
		'testCase',
		'lastTimeToRun',
		'lastResult',
		'logger'
	],
	#category : 'MuTalk-Model-Core',
	#package : 'MuTalk-Model',
	#tag : 'Core'
}

{ #category : 'instance creation' }
MTTestCaseReference class >> for: aTestCase [

	^ self new initializeFor: aTestCase
]

{ #category : 'instance creation' }
MTTestCaseReference class >> for: aTestCase logger: aLogger [

	^ self new initializeFor: aTestCase logger: aLogger
]

{ #category : 'comparing' }
MTTestCaseReference >> = anObject [

	self == anObject ifTrue: [ ^ true ].
	anObject species = self class ifFalse: [ ^ false ].
	self testCaseClass = anObject testCaseClass ifFalse: [ ^ false ].
	^ self selector = anObject selector
]

{ #category : 'defaults' }
MTTestCaseReference >> defaultLogger [

	^ MTNullLogger new
]

{ #category : 'comparing' }
MTTestCaseReference >> hash [

	^ testCase selector hash + testCase class hash
]

{ #category : 'initialize' }
MTTestCaseReference >> initializeFor: aTestCase [

	testCase := aTestCase.
	logger := self defaultLogger
]

{ #category : 'initialize' }
MTTestCaseReference >> initializeFor: aTestCase logger: aLogger [

	testCase := aTestCase.
	logger := aLogger
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
MTTestCaseReference >> logger [

	^ logger
]

{ #category : 'accessing' }
MTTestCaseReference >> logger: anObject [

	logger := anObject
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

	logger logRunningTest: self.
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
