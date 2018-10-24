Class {
	#name : #TestCaseReferenceTest,
	#superclass : #TestCase,
	#category : 'MuTalk-Tests'
}

{ #category : #resources }
TestCaseReferenceTest >> test1 [
	^self assert: true.
]

{ #category : #resources }
TestCaseReferenceTest >> testATestReferenceResult [
	| testReference |
	testReference := self testReferenceForTest1.
	self assert: testReference run errors isEmpty.
	
]

{ #category : #resources }
TestCaseReferenceTest >> testReferenceForTest1 [
	^ TestCaseReference 
		for: #test1
		in: self class
]
