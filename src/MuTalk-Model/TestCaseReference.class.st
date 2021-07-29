Class {
	#name : #TestCaseReference,
	#superclass : #Object,
	#instVars : [
		'class',
		'selector'
	],
	#category : 'MuTalk-Model'
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
	"kept for retrocompatibility"
	^ self runChecked
]

{ #category : #evaluating }
TestCaseReference >> runChecked [
	| result |
	result := self testCase run.
	(result failuresSize > 0 or: [ result errorsSize > 0 ])
		ifTrue: [ TestsWithErrorsException signalFor: self ].
	^ result
]

{ #category : #evaluating }
TestCaseReference >> runUnchecked [
	^ self testCase run
]

{ #category : #evaluating }
TestCaseReference >> testCase [
	^class selector: selector.
]
