Class {
	#name : #TestCaseReference,
	#superclass : #Object,
	#instVars : [
		'class',
		'selector',
		'lastTimeToRun'
	],
	#category : #'MuTalk-Model'
}

{ #category : #'instance creation' }
TestCaseReference class >> for: aSelector in: aClass [ 
	^self new initializeFor: aSelector in: aClass
]

{ #category : #'instance creation' }
TestCaseReference class >> forTestCase: aTestCase [ 
	^self for: aTestCase selector in: aTestCase class
]

{ #category : #initialize }
TestCaseReference >> initializeFor: aSelector in: aClass [
	class := aClass.
	selector := aSelector.
]

{ #category : #accessing }
TestCaseReference >> lastTimeToRun [
	^ lastTimeToRun
]

{ #category : #accessing }
TestCaseReference >> method [
	
	^ class >> selector
]

{ #category : #evaluating }
TestCaseReference >> resources [
	^self testCase resources
]

{ #category : #evaluating }
TestCaseReference >> run [
	"kept for retrocompatibility"
	
	self deprecated: 'Use #runChecked instead.' transformWith: '`@receiver run' -> '`@receiver runChecked'.
	^ self runChecked
]

{ #category : #evaluating }
TestCaseReference >> run: aTestResult [
	^self testCase run: aTestResult
]

{ #category : #evaluating }
TestCaseReference >> runChecked [
	| result |	
	result := self runUnchecked.
	(result unexpectedFailureCount > 0 or: [ result unexpectedErrorCount > 0 ])
		ifTrue: [ TestsWithErrorsException signal ].
	^ result
]

{ #category : #evaluating }
TestCaseReference >> runUnchecked [

	| result |
	lastTimeToRun := [ result := self testCase run ] timeToRun.
	^ result
]

{ #category : #evaluating }
TestCaseReference >> testCase [
	^class selector: selector.
]
