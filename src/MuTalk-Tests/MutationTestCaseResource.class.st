Class {
	#name : 'MutationTestCaseResource',
	#superclass : 'TestCase',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MutationTestCaseResource class >> packageNamesUnderTest [
	^ #('MutationTesting-Model')
]

{ #category : 'accessing' }
MutationTestCaseResource >> error [
	3 zork
]

{ #category : 'accessing' }
MutationTestCaseResource >> fail [
	self assert: false.
]

{ #category : 'accessing' }
MutationTestCaseResource >> pass [
	self assert: true
]
