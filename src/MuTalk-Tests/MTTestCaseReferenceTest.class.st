Class {
	#name : 'MTTestCaseReferenceTest',
	#superclass : 'TestCase',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'resources' }
MTTestCaseReferenceTest >> test1 [
	^self assert: true.
]

{ #category : 'resources' }
MTTestCaseReferenceTest >> testATestReferenceResult [
	| testReference |
	testReference := self testReferenceForTest1.
	self assert: testReference runUnchecked errors isEmpty.
	
]

{ #category : 'resources' }
MTTestCaseReferenceTest >> testReferenceForTest1 [

	^ MTTestCaseReference for: (self class selector: #test1)
]
