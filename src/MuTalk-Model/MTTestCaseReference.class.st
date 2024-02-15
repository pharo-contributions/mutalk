Class {
	#name : 'MTTestCaseReference',
	#superclass : 'Object',
	#instVars : [
		'class',
		'selector',
		'lastTimeToRun'
	],
	#category : 'MuTalk-Model',
	#package : 'MuTalk-Model'
}

{ #category : 'instance creation' }
MTTestCaseReference class >> for: aSelector in: aClass [ 
	^self new initializeFor: aSelector in: aClass
]

{ #category : 'instance creation' }
MTTestCaseReference class >> forTestCase: aTestCase [ 
	^self for: aTestCase selector in: aTestCase class
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

	^ selector hash + class hash
]

{ #category : 'initialize' }
MTTestCaseReference >> initializeFor: aSelector in: aClass [
	class := aClass.
	selector := aSelector.
]

{ #category : 'accessing' }
MTTestCaseReference >> lastTimeToRun [
	^ lastTimeToRun
]

{ #category : 'accessing' }
MTTestCaseReference >> method [
	
	^ class >> selector
]

{ #category : 'printing' }
MTTestCaseReference >> printOn: aStream [

	aStream nextPutAll: (aStream print: self testCase)
]

{ #category : 'evaluating' }
MTTestCaseReference >> resources [
	^self testCase resources
]

{ #category : 'evaluating' }
MTTestCaseReference >> run [
	"kept for retrocompatibility"
	
	self deprecated: 'Use #runChecked instead.' transformWith: '`@receiver run' -> '`@receiver runChecked'.
	^ self runChecked
]

{ #category : 'evaluating' }
MTTestCaseReference >> run: aTestResult [
	^self testCase run: aTestResult
]

{ #category : 'evaluating' }
MTTestCaseReference >> runChecked [
	| result |	
	result := self runUnchecked.
	(result unexpectedFailureCount > 0 or: [ result unexpectedErrorCount > 0 ])
		ifTrue: [ MTTestsWithErrorsException signal ].
	^ result
]

{ #category : 'evaluating' }
MTTestCaseReference >> runUnchecked [

	| result |
	lastTimeToRun := [ result := self testCase run ] timeToRun.
	^ result
]

{ #category : 'accessing' }
MTTestCaseReference >> selector [

	^ selector
]

{ #category : 'evaluating' }
MTTestCaseReference >> testCase [
	^class selector: selector.
]

{ #category : 'accessing' }
MTTestCaseReference >> testCaseClass [

	^ class
]
