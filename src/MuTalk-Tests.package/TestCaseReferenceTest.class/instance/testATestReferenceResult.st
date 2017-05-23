resources
testATestReferenceResult
	| testReference |
	testReference := self testReferenceForTest1.
	self assert: testReference run errors isEmpty.
	