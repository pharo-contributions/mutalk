Class {
	#name : 'MTMutationTestCaseResource',
	#superclass : 'TestCase',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MTMutationTestCaseResource class >> packageNamesUnderTest [
	^ #('MutationTesting-Model')
]

{ #category : 'accessing' }
MTMutationTestCaseResource >> error [
	3 zork
]

{ #category : 'accessing' }
MTMutationTestCaseResource >> fail [
	self assert: false.
]

{ #category : 'accessing' }
MTMutationTestCaseResource >> pass [
	self assert: true
]
