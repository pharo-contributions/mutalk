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
	| result |
	result := self testCase run.
	(result failuresSize > 0 or: [ result errorsSize > 0])
		ifTrue: [TestsWithErrorsException signal].
	^ result
]

{ #category : #evaluating }
TestCaseReference >> run: aTestResult [
	^self testCase run: aTestResult
]

{ #category : #evaluating }
TestCaseReference >> testCase [
	^class selector: selector.
]
