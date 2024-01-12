Class {
	#name : 'MTFakeInfiniteLoopsTest',
	#superclass : 'TestCase',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'tests' }
MTFakeInfiniteLoopsTest >> testIterativeFactorial [

	| ins |
	ins := FakeInfiniteLoopForTest new.
	self assert: (ins iterativeFactorial: 3) equals: 6.
	self assert: (ins iterativeFactorial: 5) equals: 120
]

{ #category : 'tests' }
MTFakeInfiniteLoopsTest >> testRecursiveFactorial [

	| ins |
	ins := FakeInfiniteLoopForTest new.
	self assert: (ins recursiveFactorial: 3) equals: 6.
	self assert: (ins recursiveFactorial: 5) equals: 120
]
