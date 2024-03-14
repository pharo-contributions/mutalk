Class {
	#name : 'MTTestCaseReference',
	#superclass : 'Object',
	#instVars : [
		'testCase',
		'lastTimeToRun'
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
	"kept for retrocompatibility"
	
	self deprecated: 'Use #runChecked instead.' transformWith: '`@receiver run' -> '`@receiver runChecked'.
	^ self runChecked
]

{ #category : 'evaluating' }
MTTestCaseReference >> run: aTestResult [

	^ testCase run: aTestResult
]

{ #category : 'evaluating' }
MTTestCaseReference >> runChecked [

	| result |
	result := self runUnchecked.
	(result unexpectedFailureCount > 0 or: [
		 result unexpectedErrorCount > 0 ]) ifTrue: [
		MTTestsWithErrorsException signal ].
	^ result
]

{ #category : 'evaluating' }
MTTestCaseReference >> runUnchecked [

	| result |
	lastTimeToRun := [ result := testCase run ] timeToRun.
	^ result
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
